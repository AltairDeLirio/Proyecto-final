using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
using UnityEngine.SceneManagement;

public class ScriptReader : MonoBehaviour
{
    [SerializeField] private TextAsset _InkJsonFile;
    private Story _StoryScript;

    public TMP_Text dialogueBox;
    public TMP_Text nameTag;

    public Image characterIconLeft;
    public Image characterIconRight;

    private Dictionary<string, Sprite> characterSprites = new Dictionary<string, Sprite>();

    void Start()
    {
        LoadStory();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            DisplayNextLine();
        }
    }

    void LoadStory()
    {
        _StoryScript = new Story(_InkJsonFile.text);

        // restore story when changing from other scene
        if (PlayerPrefs.HasKey("Game"))
        {
            string savedState = PlayerPrefs.GetString("Game");
            _StoryScript.state.LoadJson(savedState);
        }

        _StoryScript.BindExternalFunction("Name", (string charName) => ChangeName(charName));
        _StoryScript.BindExternalFunction("CharacterIcon", (string charName) => ShowCharacter(charName));
        _StoryScript.BindExternalFunction("HideCharacter", (string charName) => HideCharacter(charName));
        _StoryScript.BindExternalFunction("Expression", (string expressionName) => ChangeCharacterExpression(expressionName));

        DisplayNextLine();
    }

    public void DisplayNextLine()
    {
        if (_StoryScript.canContinue)
        {
            string text = _StoryScript.Continue()?.Trim();
            dialogueBox.text = text;

            // Process scene change tags
            List<string> tags = _StoryScript.currentTags;
            foreach (string tag in tags)
            {
                if (tag.StartsWith("change_scene:"))
                {
                    string targetScene = tag.Split(':')[1].Trim();

                    // Save story state
                    PlayerPrefs.SetString("Game", _StoryScript.state.ToJson());
                    PlayerPrefs.SetString("InkCurrentKnot", _StoryScript.currentPathString);
                    PlayerPrefs.Save();

                    // Load new Unity scene
                    SceneManager.LoadScene(targetScene);
                    return;
                }
            }
        }
        else
        {
            dialogueBox.text = "The end";
        }
    }

    public void ChangeName(string name)
    {
        nameTag.text = name;
    }

    public void ShowCharacter(string charName)
    {
        Sprite characterIconSprite = Resources.Load<Sprite>("CharacterIcons/" + charName);
        if (characterIconSprite == null)
        {
            Debug.LogWarning("Character icon not found: " + charName);
            return;
        }

        characterSprites[charName] = characterIconSprite;

        List<string> activeCharacters = new List<string>(characterSprites.Keys);

        if (activeCharacters.Count == 1)
        {
            characterIconLeft.gameObject.SetActive(true);
            characterIconRight.gameObject.SetActive(false);

            characterIconLeft.sprite = characterIconSprite;
            characterIconLeft.rectTransform.anchoredPosition = Vector2.zero;
        }
        else if (activeCharacters.Count == 2)
        {
            string first = activeCharacters[0];
            string second = activeCharacters[1];

            characterIconLeft.gameObject.SetActive(true);
            characterIconRight.gameObject.SetActive(true);

            characterIconLeft.sprite = characterSprites[first];
            characterIconRight.sprite = characterSprites[second];
        }
    }

    public void HideCharacter(string charName)
    {
        if (!characterSprites.ContainsKey(charName)) return;

        characterSprites.Remove(charName);

        if (characterSprites.Count == 0)
        {
            characterIconLeft.gameObject.SetActive(false);
            characterIconRight.gameObject.SetActive(false);
        }
        else if (characterSprites.Count == 1)
        {
            string remaining = new List<string>(characterSprites.Keys)[0];

            characterIconLeft.sprite = characterSprites[remaining];
            characterIconLeft.rectTransform.anchoredPosition = Vector2.zero;
            characterIconLeft.gameObject.SetActive(true);
            characterIconRight.gameObject.SetActive(false);
        }
        else if (characterSprites.Count == 2)
        {
            string first = new List<string>(characterSprites.Keys)[0];
            string second = new List<string>(characterSprites.Keys)[1];

            characterIconLeft.sprite = characterSprites[first];
            characterIconRight.sprite = characterSprites[second];

            characterIconLeft.gameObject.SetActive(true);
            characterIconRight.gameObject.SetActive(true);
        }
    }

    public void ChangeCharacterExpression(string expressionName)
    {
        foreach (var key in new List<string>(characterSprites.Keys))
        {
            string path = "CharacterIcons/Expressions/" + key + "_" + expressionName;
            Sprite newSprite = Resources.Load<Sprite>(path);
            if (newSprite != null)
            {
                characterSprites[key] = newSprite;

                if (characterIconLeft.sprite.name.Contains(key))
                    characterIconLeft.sprite = newSprite;
                if (characterIconRight.sprite.name.Contains(key))
                    characterIconRight.sprite = newSprite;
            }
        }
    }
}

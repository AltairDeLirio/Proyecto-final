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
    public Image background;

    public Button[] choiceButtons;
    public float timeLimit = 5f;

    public Slider choiceTimerSlider;

    private Dictionary<string, Sprite> characterSprites = new Dictionary<string, Sprite>();
    private float timeRemaining;
    private bool timerRunning = false;
    private bool choiceMade = false;

    void Start()
    {
        if (PlayerPrefs.GetInt("FromMainMenu", 0) == 1)
        {
            PlayerPrefs.DeleteKey("Game");
            PlayerPrefs.SetInt("FromMainMenu", 0);
        }

        LoadStory();
    }

    void Update()
    {
        if (PauseMenuController.isPaused || _StoryScript == null) return;

        if (timerRunning && !choiceMade)
        {
            timeRemaining -= Time.deltaTime;
            if (choiceTimerSlider != null)
                choiceTimerSlider.value = Mathf.Max(0, timeRemaining);

            if (timeRemaining <= 0)
            {
                timerRunning = false;
                AutoChooseFallback();
            }
        }

        if (_StoryScript.currentChoices.Count == 0 &&
            (Input.GetKeyDown(KeyCode.Space) || Input.GetMouseButtonDown(0)))
        {
            DisplayNextLine();
        }
    }

    void LoadStory()
    {
        _StoryScript = new Story(_InkJsonFile.text);

        bool fromMainMenu = PlayerPrefs.GetInt("FromMainMenu", 0) == 1;
        bool returningToStory = PlayerPrefs.GetInt("ReturningToStory", 0) == 1;

        if (!fromMainMenu && SaveManager.HasSaveData())
        {
            string savedState = SaveManager.GetSavedInkState();
            if (!string.IsNullOrEmpty(savedState))
            {
                _StoryScript.state.LoadJson(savedState);
            }
        }

        PlayerPrefs.SetInt("FromMainMenu", 0);
        PlayerPrefs.SetInt("ReturningToStory", 0);

        _StoryScript.BindExternalFunction("Name", (string charName) => ChangeName(charName));
        _StoryScript.BindExternalFunction("CharacterIcon", (string charName) => ShowCharacter(charName));
        _StoryScript.BindExternalFunction("HideCharacter", (string charName) => HideCharacter(charName));
        _StoryScript.BindExternalFunction("Expression", (string expressionName) => ChangeCharacterExpression(expressionName));
        _StoryScript.BindExternalFunction("Background", (string bg) => ChangeBackground(bg));

        DisplayNextLine();
    }

    public void DisplayNextLine()
    {
        if (_StoryScript == null)
        {
            Debug.LogWarning("No story script loaded.");
            return;
        }

        if (_StoryScript.canContinue)
        {
            string text = _StoryScript.Continue()?.Trim();
            dialogueBox.text = string.IsNullOrEmpty(text) ? "[...] (Empty line)" : text;

            List<string> tags = _StoryScript.currentTags;
            foreach (string tag in tags)
            {
                if (tag.StartsWith("change_scene:"))
                {
                    string targetScene = tag.Split(':')[1].Trim();

                    PlayerPrefs.SetString("Game", _StoryScript.state.ToJson());
                    PlayerPrefs.SetInt("ReturningToStory", 1); // <- mark we’re returning later
                    PlayerPrefs.Save();

                    SceneManager.LoadScene(targetScene);
                    return;
                }
            }

            if (_StoryScript.currentChoices.Count > 0)
            {
                ShowChoices();
            }
            else
            {
                HideAllChoices();
            }
        }
        else if (_StoryScript.currentChoices.Count > 0)
        {
            ShowChoices();
        }
        else
        {
            dialogueBox.text = "The end.";
            HideAllChoices();
        }
    }

    void ShowChoices()
    {
        HideAllChoices();

        bool isTimed = _StoryScript.currentTags.Contains("timed");

        for (int i = 0; i < choiceButtons.Length; i++)
        {
            Button btn = choiceButtons[i];
            if (i < _StoryScript.currentChoices.Count)
            {
                Choice choice = _StoryScript.currentChoices[i];

                btn.gameObject.SetActive(true);
                btn.interactable = true;
                btn.GetComponentInChildren<TextMeshProUGUI>().text = choice.text;

                int index = i;
                btn.onClick.RemoveAllListeners();
                btn.onClick.AddListener(() => MakeChoice(index));
            }
            else
            {
                btn.gameObject.SetActive(false);
                btn.onClick.RemoveAllListeners();
            }
        }

        if (isTimed)
        {
            StartTimer();
        }
        else
        {
            ResetTimer();
        }
    }

    void MakeChoice(int choiceIndex)
    {
        if (choiceIndex < 0 || choiceIndex >= _StoryScript.currentChoices.Count)
            return;

        choiceMade = true;
        _StoryScript.ChooseChoiceIndex(choiceIndex);
        ResetTimer();
        DisplayNextLine();
    }

    void StartTimer()
    {
        timeRemaining = timeLimit;
        timerRunning = true;
        choiceMade = false;

        if (choiceTimerSlider != null)
        {
            choiceTimerSlider.maxValue = timeLimit;
            choiceTimerSlider.value = timeLimit;
            choiceTimerSlider.gameObject.SetActive(true);
        }
    }

    void ResetTimer()
    {
        timerRunning = false;
        timeRemaining = 0;
        choiceMade = false;

        if (choiceTimerSlider != null)
            choiceTimerSlider.gameObject.SetActive(false);
    }

    void AutoChooseFallback()
    {
        if (_StoryScript.currentChoices.Count > 0)
        {
            MakeChoice(_StoryScript.currentChoices.Count - 1);
        }
    }

    void HideAllChoices()
    {
        foreach (Button btn in choiceButtons)
        {
            btn.gameObject.SetActive(false);
            btn.onClick.RemoveAllListeners();
        }

        if (choiceTimerSlider != null)
            choiceTimerSlider.gameObject.SetActive(false);
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

        var active = new List<string>(characterSprites.Keys);
        if (active.Count == 1)
        {
            characterIconLeft.sprite = characterIconSprite;
            characterIconLeft.gameObject.SetActive(true);
            characterIconRight.gameObject.SetActive(false);
        }
        else if (active.Count == 2)
        {
            characterIconLeft.sprite = characterSprites[active[0]];
            characterIconRight.sprite = characterSprites[active[1]];
            characterIconLeft.gameObject.SetActive(true);
            characterIconRight.gameObject.SetActive(true);
        }
    }

    public void HideCharacter(string charName)
    {
        if (!characterSprites.ContainsKey(charName)) return;

        characterSprites.Remove(charName);
        var keys = new List<string>(characterSprites.Keys);

        if (keys.Count == 0)
        {
            characterIconLeft.gameObject.SetActive(false);
            characterIconRight.gameObject.SetActive(false);
        }
        else if (keys.Count == 1)
        {
            characterIconLeft.sprite = characterSprites[keys[0]];
            characterIconLeft.gameObject.SetActive(true);
            characterIconRight.gameObject.SetActive(false);
        }
        else if (keys.Count == 2)
        {
            characterIconLeft.sprite = characterSprites[keys[0]];
            characterIconRight.sprite = characterSprites[keys[1]];
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

    public void ChangeBackground(string bg)
    {
        Sprite backgroundSprite = Resources.Load<Sprite>("UI/" + bg);
        if (backgroundSprite == null)
        {
            Debug.LogWarning("Background not found: " + bg);
            return;
        }

        background.sprite = backgroundSprite;
    }

    public void ResetStoryProgress()
    {
        PlayerPrefs.DeleteKey("Game");
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }
}

using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;

public class ChoiceManager : MonoBehaviour
{
    public TextAsset inkJSONAsset;
    private Story story;

    public TextMeshProUGUI dialogueText;
    public Button[] choiceButtons;
    public float timeLimit = 5f;

    private float timeRemaining;
    private bool timerRunning = false;
    private bool choiceMade = false;

    void Start()
    {
        story = new Story(inkJSONAsset.text);
        StartCoroutine(ContinueStory());
    }

    IEnumerator ContinueStory()
    {
        while (story.canContinue)
        {
            dialogueText.text = story.Continue();
            yield return null;
        }

        if (story.currentChoices.Count > 0)
        {
            ShowChoices();
        }
        else
        {
            HideAllChoices();
        }
    }

    void ShowChoices()
    {
        HideAllChoices(); // Reset buttons

        // Check for "#timed" tag
        bool isTimed = story.currentTags.Contains("timed");

        for (int i = 0; i < choiceButtons.Length; i++)
        {
            if (i < story.currentChoices.Count)
            {
                Choice choice = story.currentChoices[i];
                Button btn = choiceButtons[i];

                btn.gameObject.SetActive(true);
                btn.GetComponentInChildren<TextMeshProUGUI>().text = choice.text;

                int choiceIndex = i;
                btn.onClick.RemoveAllListeners();
                btn.onClick.AddListener(() => MakeChoice(choiceIndex));
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
        if (!story.currentChoices.Exists(c => story.currentChoices.IndexOf(c) == choiceIndex))
            return;

        choiceMade = true;
        story.ChooseChoiceIndex(choiceIndex);
        ResetTimer();
        StartCoroutine(ContinueStory());
    }

    void StartTimer()
    {
        timeRemaining = timeLimit;
        timerRunning = true;
        choiceMade = false;
    }

    void ResetTimer()
    {
        timerRunning = false;
        timeRemaining = 0;
        choiceMade = false;
    }

    void Update()
    {
        if (timerRunning && !choiceMade)
        {
            timeRemaining -= Time.deltaTime;
            if (timeRemaining <= 0)
            {
                timerRunning = false;
                AutoChooseFallback();
            }
        }
    }

    void AutoChooseFallback()
    {
        if (story.currentChoices.Count > 0)
        {
            int fallbackIndex = story.currentChoices.Count - 1;
            MakeChoice(fallbackIndex);
        }
    }

    void HideAllChoices()
    {
        foreach (Button btn in choiceButtons)
        {
            btn.gameObject.SetActive(false);
            btn.onClick.RemoveAllListeners();
        }
    }
}

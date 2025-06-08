using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;

public class MainMenu : MonoBehaviour
{
    public GameObject continueButton;

    void Start()
    {
        Button btn = continueButton.GetComponent<Button>();

        if (btn != null)
        {
            bool hasSave = SaveManager.HasSaveData();

            btn.interactable = hasSave;

            TextMeshProUGUI btnText = continueButton.GetComponentInChildren<TextMeshProUGUI>();
            if (btnText != null)
            {
                btnText.color = hasSave ? Color.black : new Color(0.6f, 0.6f, 0.6f);
            }
        }
    }

    public void Play()
    {
        SaveManager.NewGame("CinematicIntro");
    }

    public void Continue()
    {
        if (SaveManager.HasSaveData())
        {
            SaveManager.ContinueGame();
        }
    }

    public void Quit()
    {
        Application.Quit();
    }
}

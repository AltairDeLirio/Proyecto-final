using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;

public class GameOverMenu : MonoBehaviour
{
    public GameObject continueButton;
    public Button continueButtonComponent;
    public TextMeshProUGUI continueButtonText;

    void Start()
    {
        bool hasSave = SaveManager.HasSaveData();

        if (continueButtonComponent != null)
            continueButtonComponent.interactable = hasSave;

        if (continueButtonText != null)
            continueButtonText.color = hasSave ? Color.white : new Color(0.6f, 0.6f, 0.6f);
    }

    public void ReturnToMainMenu()
    {
        PauseMenuController.isPaused = false;
        Time.timeScale = 1;

        SceneManager.LoadScene("Title");
    }

    public void ContinueFromLastSave()
    {
        if (SaveManager.HasSaveData())
        {
            PauseMenuController.isPaused = false;
            Time.timeScale = 1;
            SaveManager.ContinueGame();
        }
    }

    public void QuitGame()
    {
        Application.Quit();
    }
}

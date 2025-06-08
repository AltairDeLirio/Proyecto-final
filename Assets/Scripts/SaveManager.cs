using UnityEngine;
using UnityEngine.SceneManagement;
using Ink.Runtime;

public static class SaveManager
{
    private const string SaveKey = "Game";
    private const string SceneKey = "SavedScene";

    public static void SaveGame(Story currentStory)
    {
        if (currentStory != null)
        {
            string json = currentStory.state.ToJson();
            PlayerPrefs.SetString(SaveKey, json);
            PlayerPrefs.SetString(SceneKey, SceneManager.GetActiveScene().name);
            PlayerPrefs.Save();
        }
    }

    public static bool HasSaveData()
    {
        return PlayerPrefs.HasKey(SaveKey) && PlayerPrefs.HasKey(SceneKey);
    }

    public static void ClearSave()
    {
        PlayerPrefs.DeleteKey(SaveKey);
        PlayerPrefs.DeleteKey(SceneKey);
        PlayerPrefs.DeleteKey("FromMainMenu");
    }

    public static void ContinueGame()
    {
        if (HasSaveData())
        {
            PlayerPrefs.SetInt("FromMainMenu", 2); // Flag for continue
            SceneManager.LoadScene(PlayerPrefs.GetString(SceneKey));
        }
    }

    public static void NewGame(string firstScene)
    {
        ClearSave(); // Always reset save when starting new
        PlayerPrefs.SetInt("FromMainMenu", 1); // Flag for new game
        SceneManager.LoadScene(firstScene);
    }

    public static string GetSavedInkState()
    {
        return PlayerPrefs.GetString(SaveKey, null);
    }
}

using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;

    public int maxLives = 3;
    private int currentLives;

    public int maxTargets = 5;
    private int targetsRemaining;

    public GameObject gameOverPanel;
    public GameObject winPanel;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    void Start()
    {
        currentLives = maxLives;
        targetsRemaining = maxTargets;

        UIManager.Instance.UpdateLives(currentLives);
    }

    public void LoseLife()
    {
        currentLives--;
        UIManager.Instance.UpdateLives(currentLives);

        if (currentLives <= 0)
        {
            GameOver();
        }
    }

    public void TargetDestroyed()
    {
        targetsRemaining--;

        if (targetsRemaining <= 0 && currentLives > 0)
        {
            MinigameComplete();
        }
    }

    void GameOver()
    {
        Time.timeScale = 0f;
        gameOverPanel.SetActive(true);
    }

    void MinigameComplete()
    {
        Time.timeScale = 0f;
        winPanel.SetActive(true);
    }

    public void RestartGame()
    {
        Time.timeScale = 1f;
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }

    public void QuitGame()
    {
        Time.timeScale = 1f;
        Debug.Log("Saliendo del minijuego...");
    }

    public bool CanSpawnTarget()
    {
        return targetsRemaining > 0;
    }
}
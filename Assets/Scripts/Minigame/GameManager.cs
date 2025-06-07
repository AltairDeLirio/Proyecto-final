using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;

    public int maxLives = 3;
    private int currentLives;

    public int maxTargets = 10; // Ahora se gana al destruir 10 enemigos
    private int targetsRemaining;

    public GameObject gameOverPanel;
    public GameObject winPanel;
    private TargetSpawner targetSpawner;


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
        targetSpawner = FindFirstObjectByType<TargetSpawner>();


    }

    public void LoseLife()
    {
        currentLives--;
        UIManager.Instance.UpdateLives(currentLives);

        targetsRemaining--;

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
        Time.timeScale = 1f;
        int previousIndex = SceneManager.GetActiveScene().buildIndex - 1;
        if (previousIndex >= 0)
        {
            SceneManager.LoadScene(previousIndex);
        }
    }


    public void RestartGame()
    {
        currentLives = maxLives;
        targetsRemaining = maxTargets;

        UIManager.Instance.UpdateLives(currentLives);
        gameOverPanel.SetActive(false);
        winPanel.SetActive(false);
        Time.timeScale = 1f;

        // Eliminar enemigos activos
        foreach (Target t in FindObjectsByType<Target>(FindObjectsSortMode.None))
        {
            Destroy(t.gameObject);
        }

        // Reiniciar spawner
        if (targetSpawner == null)
            targetSpawner = FindFirstObjectByType<TargetSpawner>();

        targetSpawner.RestartSpawner();
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
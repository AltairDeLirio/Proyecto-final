using UnityEngine;

public class TargetSpawner : MonoBehaviour
{
    public GameObject targetPrefab;
    public float spawnInterval = 2f;
    public Vector2 spawnPosition = new Vector2(-10f, 0f);
    public Vector2 spawnRange = new Vector2(0f, 4f);

    private int spawnedTargets = 0;

    void Start()
    {
        InvokeRepeating(nameof(SpawnTarget), 1f, spawnInterval);
    }

    void SpawnTarget()
    {
        if (!GameManager.Instance.CanSpawnTarget())
        {
            CancelInvoke(nameof(SpawnTarget));
            return;
        }

        float yOffset = Random.Range(-spawnRange.y, spawnRange.y);
        Vector3 spawnPos = new Vector3(spawnPosition.x, spawnPosition.y + yOffset, 0f);

        Instantiate(targetPrefab, spawnPos, Quaternion.identity);
        spawnedTargets++;
    }
}
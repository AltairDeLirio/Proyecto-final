using UnityEngine;

public class Target : MonoBehaviour
{
    public float speed = 2f;
    public Vector2 direction = Vector2.right;
    public float lifetime = 4f;

    private void Start()
    {
        Destroy(gameObject, lifetime);
        Invoke(nameof(AttackPlayer), lifetime);
    }

    void Update()
    {
        transform.Translate(direction * speed * Time.deltaTime);
    }

    void OnMouseDown()
    {
        CancelInvoke(nameof(AttackPlayer));
        Destroy(gameObject);
        GameManager.Instance.TargetDestroyed();
    }

    void AttackPlayer()
    {
        if (GameManager.Instance != null)
        {
            GameManager.Instance.LoseLife();
        }
        Destroy(gameObject);
    }
}
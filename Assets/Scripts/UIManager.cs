using DG.Tweening.Core.Easing;
using UnityEngine;
using UnityEngine.SceneManagement;

public class UIManager : MonoBehaviour
{
    public GameObject gameOverObject;

    public void EnableGameOverMenue()
    {

        gameOverObject.SetActive(true);
    }

    public void OnEnable()
    {
        PlayerManager.OnGameOver += EnableGameOverMenue;

    }

    public void OnDisable()
    {
        PlayerManager.OnGameOver -= EnableGameOverMenue;
    }

    public void Retry()

    {
        SceneManager.LoadScene("Menu");
    }


    public void returnToMainMenu()

    {
        SceneManager.LoadScene("MainScreen");

    }
    //// comment to test git
    


}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EventManager : MonoBehaviour
{
    public static EventManager instance = null;

    public delegate void VoidNoParams();
    public static event VoidNoParams Movement;

    // Start is called before the first frame update
    void Start()
    {
        if (instance == null)//This will ensure that there is only a single instance of this class in the game at all times.
        {
            instance = this;
            DontDestroyOnLoad(this.gameObject);
        }
        else
        {
            if (instance != this)
            {
                Destroy(this.gameObject);
            }
        }

        DontDestroyOnLoad(gameObject); //This object will persist through scenes
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Movement?.Invoke();
        }
    }
}

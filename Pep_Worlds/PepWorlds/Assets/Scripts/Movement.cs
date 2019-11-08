using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Movement : MonoBehaviour
{
    public LayerMask canBeClicked;
    private NavMeshAgent myAgent;
    private Animator playerAnim;
    public Transform destination;

    private void OnEnable()
    {
        EventManager.Movement += Move;
    }

    private void OnDisable()
    {
        EventManager.Movement -= Move;
    }

    // Start is called before the first frame update
    void Start()
    {
        myAgent = GetComponent<NavMeshAgent>();
        playerAnim = GetComponent<Animator>();
    }

    //private void Update()
    //{
    //    if (transform.position == myAgent.pathEndPosition && playerAnim.GetBool(HashTable.Walking))
    //    {
    //        playerAnim.SetBool("Walking", false);
    //    }
    //}

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.GetInstanceID() == destination.gameObject.GetInstanceID())
        {
            playerAnim.SetBool("Walking", false);
        }
    }

    void Move()
    {
        Ray myRay = Camera.main.ScreenPointToRay(Input.mousePosition);

        if (Physics.Raycast(myRay, out RaycastHit hitInfo, 100, canBeClicked))
        {
            myAgent.SetDestination(hitInfo.point);
            playerAnim.SetBool("Walking", true);
            destination.position = hitInfo.point;
        }
    }
}

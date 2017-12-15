using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using HoloToolkit.Unity.InputModule;

public class InkControl : MonoBehaviour, IHoldHandler {

    //ParticleSystem inkFire = particlePrefab.GetComponent<ParticleSystem>();

    private ParticleSystem particle;

    // Use this for initialization
    void Start () {
        InputManager.Instance.AddGlobalListener(gameObject);

        particle = this.GetComponent<ParticleSystem>();   
        particle.Stop();
    }
	
	// Update is called once per frame
	void Update () {
	
	}


    public void OnHoldStarted(HoldEventData eventData)
    {
        particle.Play();
    }

    public void OnHoldCompleted(HoldEventData eventData)
    {
        particle.Stop();
    }

    public void OnHoldCanceled(HoldEventData eventData) { }


}

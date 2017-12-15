using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using HoloToolkit.Unity.InputModule;

public class InkControlClicked : MonoBehaviour, IInputClickHandler {

    //ParticleSystem inkFire = particlePrefab.GetComponent<ParticleSystem>();

    private ParticleSystem particle;

    // Use this for initialization
    void Start()
    {
        InputManager.Instance.AddGlobalListener(gameObject);

        particle = this.GetComponent<ParticleSystem>();
        particle.Stop();
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void OnInputClicked(InputClickedEventData eventData)
    {
        particle.Play();
    }

}

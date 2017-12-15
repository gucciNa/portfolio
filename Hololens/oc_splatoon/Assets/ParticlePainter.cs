using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Es.InkPainter;

public class ParticlePainter : MonoBehaviour {

    public Brush Brush = null;
    public ParticleSystem Particle;

    private List<ParticleCollisionEvent> _collisionEvents;

    int sphere1count;
    int sphere2count;
    int sphere3count;
    int s4count;
    int s5count;
    int s6count;
    int s7count;
    int s8count;

    // Use this for initialization
    void Start() {
        this.Particle = this.GetComponent<ParticleSystem>();
        this._collisionEvents = new List<ParticleCollisionEvent>(16);
        sphere1count = 0;
        sphere2count = 0;
        sphere3count = 0;
        s4count = 0;
        s5count = 0;
        s6count = 0;
        s7count = 0;
        s8count = 0;
    }

    // Update is called once per frame
    void Update() {

    }

    private void OnParticleCollision(GameObject other)
    {
        var safeSize = Particle.GetSafeCollisionEventSize();
        if (this._collisionEvents.Count < safeSize)
        {
            this._collisionEvents = new List<ParticleCollisionEvent>(safeSize);
        }

        this.Particle.GetCollisionEvents(other, this._collisionEvents);

        foreach (var collisionEvent in this._collisionEvents)
        {
            if (collisionEvent.colliderComponent == null)
            {
                continue;
            }

            var canvas = collisionEvent.colliderComponent.GetComponent<InkCanvas>();
            if (canvas == null)
            {
                continue;
            }
            canvas.PaintNearestTriangleSurface(Brush, collisionEvent.intersection);
            if (other.gameObject.tag == "sphere1") {
                if (sphere1count >= 40) {
                    Object.Destroy(other);
                }
                sphere1count++;
            }
            if (other.gameObject.tag == "sphere2") {
                if (sphere2count >= 40) {
                    Object.Destroy(other);
                }
                sphere2count++;
            }
            if (other.gameObject.tag == "sphere3")
            {
                if (sphere3count >= 40)
                {
                    Object.Destroy(other);
                }
                sphere3count++;
            }
            if (other.gameObject.tag == "s4") {
                if (s4count >= 40) {
                    Object.Destroy(other);
                }
                s4count++;
            }
            if (other.gameObject.tag == "s5")
            {
                if (s5count >= 40)
                {
                    Object.Destroy(other);
                }
                s5count++;
            }
            if (other.gameObject.tag == "s6")
            {
                if (s6count >= 40)
                {
                    Object.Destroy(other);
                }
                s6count++;
            }
            if (other.gameObject.tag == "s7")
            {
                if (s7count >= 40)
                {
                    Object.Destroy(other);
                }
                s7count++;
            }
            if (other.gameObject.tag == "s8")
            {
                if (s8count >= 40)
                {
                    Object.Destroy(other);
                }
                s8count++;
            }
        }
    }
}
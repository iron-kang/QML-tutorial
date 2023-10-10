import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Particles 2.0

Item {
    width: 640
    height: 480

    Rectangle {
        anchors.fill: parent
        color: "black"

        ParticleSystem {
            anchors.fill: parent

            ImageParticle {
                source: "images/snowflake.png"
                entryEffect: ImageParticle.Scale
                rotationVariation: 180
                rotationVelocity: 30
                color: "white"
            }

            Emitter {
                velocity: AngleDirection { angleVariation: 360; magnitude: 30 }
                lifeSpan: 3000
                emitRate: 20
                size: 32
                sizeVariation: 10
                width: parent.width
                height: parent.height
            }

            ImageParticle {
                groups: ["stars"]
                anchors.fill: parent
                source: "images/stars.png"
            }
            Emitter {
              group: "stars"
              emitRate: 40
              lifeSpan: 2400
              size: 24
              sizeVariation: 8
              anchors.fill: parent
              velocity: AngleDirection { angleVariation: 360; magnitude: 3 }
          }

        }
    }
}

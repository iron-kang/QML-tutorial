import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Particles 2.0

Item {
    width: 240
    height: 280
    Rectangle {
        anchors.fill: parent
        color: "#222222"

        ParticleSystem {
            anchors.fill: parent

            ImageParticle {
                groups: ["smoke"]
                color: "#11111111"
                source: "images/glowdot.png"
            }

            ImageParticle {
                groups: ["flame"]
                source: "images/glowdot.png"
                color: "#11ff4004f"
                colorVariation: 0.1
            }

            Emitter {
                id: emitter
                anchors.centerIn: parent
                group: "flame"
                emitRate: 120
                lifeSpan: 1200
                size: 20
                endSize: 10
                sizeVariation: 10
                acceleration: PointDirection { y: -40 }
                velocity: AngleDirection {
                    angle: 270
                    magnitude: 20
                    angleVariation: 22
                    magnitudeVariation: 5
                }
            }

            TrailEmitter {
                group: "smoke"
                follow: "flame"
                emitRatePerParticle: 1
                lifeSpan: 2400
                lifeSpanVariation: 400
                size: 16
                endSize: 8
                sizeVariation: 8
                acceleration: PointDirection {y: -40}
                velocity: AngleDirection {
                    angle: 270
                    magnitude: 40
                    angleVariation: 22
                    magnitudeVariation: 5
                }
            }

            Image {
                source: "images/match.png"
                sourceSize: Qt.size(100, 100)
                anchors.top: emitter.bottom
                anchors.topMargin: -25
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -1
            }
        }

    }

}

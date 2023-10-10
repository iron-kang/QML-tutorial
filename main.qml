import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Particles 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: root
        anchors.fill: parent
        color: "black"

        Button {
            text: "Start"
            y: 0
            onClicked: particles.start()
        }

        Button {
            text: "Paue"
            y: 70
            onClicked: particles.pause()
        }

        Button {
            text: "Resume"
            y: 140
            onClicked: particles.resume()
        }

        Button {
            text: "Stop"
            y: 210
            onClicked: particles.stop()
        }

        ParticleSystem {
            id: particles
            running: false
        }

        ItemParticle {
            system: particles
            delegate: Rectangle {
                id: rect
                width: 10
                height: 10
                color: "red"
                radius: 10
            }
        }

        Emitter {
            system: particles
            x:100
            width: 540
            velocity: PointDirection {
                y: 480
                yVariation: 100
            }
            lifeSpan: 2000
            emitRate: 20
            lifeSpanVariation: 1000
        }

    }
}

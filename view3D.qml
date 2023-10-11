import QtQuick
import QtQuick3D
import QtQuick.Controls

Window {
    id: window
    width: 800
    height: 600
    title: "View3Ds with Different Cameras"
    color: "#848895"

    // The root scene
    Node {
        id: standAloneScene

        DirectionalLight {
            ambientColor: Qt.rgba(0.5, 0.5, 0.5, 1)
            brightness: 1.0
            eulerRotation.x: -25
        }

        Model {
            source: "#Cube"
            y: -104
            scale: Qt.vector3d(3, 3, 0.1)
            eulerRotation.x: -90
            materials: [
                DefaultMaterial {
                    diffuseColor: Qt.rgba(0.8, 0.8, 0.8, 1.0)
                }

            ]
        }

        Model {
            source: "model/meshes/teapot_mesh.mesh"
            y: -100
            scale: Qt.vector3d(50, 50, 50)
            materials: [
                PrincipledMaterial {
                    baseColor: "#41cd52"
                    metalness: 0
                    roughness: 0.1
                    opacity: 1.0
                }

            ]

            PropertyAnimation on eulerRotation.y {
                loops: Animation.Infinite
                duration: 5000
                to: 0
                from: -360
            }
        }

        // The predefined cameras. They have to be part of the scene, i.e. inside the root node.
        // Animated perspective camera
        Node {
            PerspectiveCamera {
                id: cameraPerspectiveOne
                z: 600
            }

            PropertyAnimation on eulerRotation.x {
                loops: Animation.Infinite
                duration: 5000
                to: -360
                from: 0
            }
        }

        // Stationary perspective camera
        PerspectiveCamera {
            id: cameraPerspectiveTwo
            z: 600
        }

        // Second animated perspective camera
        Node {
            PerspectiveCamera {
                id: cameraPerspectiveThree
                x: 500
                eulerRotation.y: 90
            }
            PropertyAnimation on eulerRotation.y {
                loops: Animation.Infinite
                duration: 15000
                to: 0
                from: -360
            }
        }

        // Stationary orthographic camera viewing from the top
        OrthographicCamera {
            id: cameraOrthographicTop
            y: 600
            eulerRotation.x: -90
        }

        // Stationary orthographic camera viewing from the front
        OrthographicCamera {
            id: cameraOrthographicFront
            z: 600
        }

        // Stationary orthographic camera viewing from left
        OrthographicCamera {
            id: cameraOrthographicLeft
            x: -600
            eulerRotation.y: -90
        }
    }

    Rectangle {
        id: topLeft
        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width * .5
        height: parent.height * .5
        color: "#848895"
        border.color: "black"

        View3D {
            id: topLeftView
            anchors.fill: parent
            importScene: standAloneScene
            camera: cameraOrthographicFront
        }

        Label {
            text: "Front"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 10
            color: "#222840"
            font.pointSize: 14
        }
    }

    Rectangle {
        id: topRight
        anchors.top: parent.top
        anchors.right: parent.right
        width: parent.width * .5
        height: parent.height * .5
        color: "transparent"
        border.color: "black"

        Label {
            text: "Perspective"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 10
            color: "#222840"
            font.pointSize: 14
        }

        View3D {
            id: topRightView
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            importScene: standAloneScene
            camera: cameraPerspectiveOne
            renderMode: View3D.Underlay

            environment: SceneEnvironment {
                clearColor: window.color
                backgroundMode: SceneEnvironment.Color
            }
        }

        Row {
            id: controlsCaontainer
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            padding: 10

            RoundButton {
                text: "Camera 1"
                highlighted: topRightView.camera == cameraPerspectiveOne
                onClicked:  {
                    topRightView.camera = cameraPerspectiveOne
                }
            }

            RoundButton {
                text: "Camera 2"
                highlighted: topRightView.camera == cameraPerspectiveTwo
                onClicked:  {
                    topRightView.camera = cameraPerspectiveTwo
                }
            }

            RoundButton {
                text: "Camera 3"
                highlighted: topRightView.camera == cameraPerspectiveThree
                onClicked:  {
                    topRightView.camera = cameraPerspectiveThree
                }
            }
        }
    }

    Rectangle {
        id: bottomLeft
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width * .5
        height: parent.height * .5
        color: "#848895"
        border.color: "black"

        View3D {
            id: bottomLeftView
            anchors.fill: parent
            importScene: standAloneScene
            camera: cameraOrthographicTop
        }

        Label {
            text: "Top"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 10
            color: "#222840"
            font.pixelSize: 14
        }
    }

    Rectangle {
        id: bottomRight
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width * .5
        height: parent.height * .5
        color: "#848895"
        border.color: "black"

        View3D {
            id: bottomRightView
            anchors.fill: parent
            importScene: standAloneScene
            camera: cameraOrthographicLeft
        }

        Label {
            text: "Left"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 10
            color: "#222840"
            font.pixelSize: 14
        }
    }

}

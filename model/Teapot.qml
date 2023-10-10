import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources
    PrincipledMaterial {
        id: principledMaterial
    }

    // Nodes:
    Node {
        id: rootNode
        Model {
            id: teapot_Node
            source: "meshes/teapot_mesh.mesh"
            materials: [
                principledMaterial
            ]
        }
    }

    // Animations:
}

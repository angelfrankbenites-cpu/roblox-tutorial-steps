# Roblox Tutorial Steps

Módulo Luau para guiar a jugadores de Roblox por una secuencia de pasos. La demo incluye dos puntos de control. El servidor comprueba el orden, que el personaje siga vivo y que esté cerca del punto. La interfaz muestra el paso actual mediante un atributo replicado del jugador. El progreso dura lo que dura la sesión del jugador.

## Abrir la demo

1. Ejecuta `rojo build default.project.json --output TutorialDemo.rbxlx`.
2. Abre `TutorialDemo.rbxlx` en Roblox Studio e inicia una prueba con Play.
3. Activa los dos puntos en orden. Prueba el segundo primero para comprobar que el tutorial se queda en el primer paso.

## Adaptarlo a tu juego

| Ruta en Roblox Studio | Tipo | Archivo |
| --- | --- | --- |
| `ReplicatedStorage.TutorialSteps` | `ModuleScript` | `TutorialSteps.luau` |
| `ReplicatedStorage.TutorialConfig` | `ModuleScript` | `TutorialConfig.luau` |
| `ServerScriptService.TutorialDemo` | `Script` | `TutorialDemo.server.luau` |
| `StarterPlayer.StarterPlayerScripts.TutorialHud` | `LocalScript` | `TutorialHud.client.luau` |

Cambia los textos y los identificadores en `TutorialConfig.luau`. Para usar la demo en tu juego, crea `Workspace.TutorialCheckpoints` con una pieza anclada por cada identificador y un `ProximityPrompt` por pieza. Para objetivos propios del juego, llama a `TutorialSteps.advance(steps, current, completedId)` desde tu lógica de servidor después de verificar el objetivo.

La prueba de la lógica portátil se ejecuta con `lune run test`. El código tiene licencia MIT.

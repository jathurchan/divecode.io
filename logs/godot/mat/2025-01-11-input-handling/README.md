---
title: "Input Handling in Godot 4.3"
date: "2025-01-11"
authors: ["mat"]
topic: "godot"
tags: ["game-development", "godot", "gdscript"]
path: "notes/godot/mat/2025-01-11-input-handling"
---

# [Sat, Jan 11](day://2025-01-11) - Input Handling in Godot 4.3

### Overview
Handling input is a crucial aspect of game development, and Godot 4.3 provides a robust system for managing user input. This experiment-based learning path covers various aspects of input handling in Godot, including:

- **Input Event Scene Flow**: Understanding how input events are propagated through the scene tree.
- **Mouse Cursor Customization**: Changing the appearance of the mouse cursor.
- **Mouse Cursor Modes**: Configuring different cursor modes for various game scenarios.

### Experiment 1: Input Event Scene Flow

#### What I Saw

> "When sending events to its child and descendant nodes, the viewport will do so, as depicted in the following graphic, in a reverse depth-first order, starting with the node at the bottom of the scene tree, and ending at the root node. Excluded from this process are Windows and SubViewports." - **Godot 4.3 Docs**

#### What I Did

Created a simple scene with a hierarchy of nodes to observe how input events are propagated through the scene tree.

<div style="text-align: center;">
    <img src="resources/input_event_scene_flow.png" alt="Input Event Scene Flow" width="300"/>
</div>

Output:

```bash
1
2
3
4
5
6
7
--- Debugging process stopped ---
```

#### What I Learned

Input events are propagated in a reverse order, starting from the node at the bottom of the scene tree and ending at the root node. Visually, you just have to read the tree from bottom to top to understand the order of input event propagation.

### Experiment 2: Mouse Cursor Customization

#### What I Saw

> "The mouse cursor can be customized by setting a custom cursor texture, hotspot, and visibility. Prefer hardware cursor when possible, as it provides better performance and is more reliable." - **Godot 4.3 Docs**

#### What I Did

Customized the mouse cursor in a Godot project by setting a custom cursor texture, hotspot, and visibility.

```gdscript
var resized_texture = resize_cursor(arrow_texture, Vector2(32, 32))
Input.set_custom_mouse_cursor(resized_texture, Input.CURSOR_ARROW, Vector2(8, 8))
```

Also, looked for [why hardware cursor is preferred over software cursor](https://www.youtube.com/watch?v=TLSg7qIUKQk) (Youtube video).

#### What I Learned

Customizing the mouse cursor in Godot is straightforward, and it can be done by setting a custom cursor texture, hotspot, and visibility. It's recommended to use the hardware cursor when possible for better performance and reliability.

But even though I found it impossible to get the cursor customization to feel right. Right now, it feels clunky near the edges of the screen.

### Experiment 3: Mouse Cursor Modes

#### What I Saw

> "Godot provides different cursor modes to suit various game scenarios, such as hiding the cursor, capturing it, or setting it to a specific mode." - **Godot 4.3 Docs**

#### What I Did

Developed a simple project where you're cursor is the godot logo. As you scroll up and down the scroll wheel, the cursor's move speed increases or decreases.

Pressing the `ESC` key will make the cursor visible and free to move outside the window. Mouse clicking inside the window will make the cursor invisible and locked inside the window.

<div style="text-align: center;">
    <img src="resources/mouse_cursor_modes.png" alt="Mouse Cursor Modes" width="600"/>
</div>

### What I Learned

Godot provides different cursor modes to suit various game scenarios, such as hiding the cursor, capturing it, or setting it to a specific mode. By using these modes, you can control the cursor behavior based on your game's requirements.

### Future Experiment Ideas

- [ ] Make the cursor feel better when near the edges of the screen.
- [ ] Learn about touch input handling in Godot.


extends Node

func imgui_checkbox(label: String, value: bool) -> bool:
    var c: Array[bool] = [value]
    ImGui.Checkbox(label, c)
    return c[0]

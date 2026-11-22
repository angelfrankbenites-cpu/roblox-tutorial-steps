--!strict
local TutorialSteps = require("./TutorialSteps")
local steps = {
	{ id = "first", text = "First step" },
	{ id = "second", text = "Second step" },
}

assert(TutorialSteps.advance(steps, 1, "second") == 1, "Cannot skip a step")
assert(TutorialSteps.advance(steps, 1, "first") == 2, "First step advances")
assert(TutorialSteps.advance(steps, 2, "first") == 2, "A duplicate does not advance")
assert(TutorialSteps.advance(steps, 2, "second") == 3, "Final step completes the tutorial")
assert(TutorialSteps.advance(steps, 3, "second") == 3, "Completed tutorials stay complete")
assert(TutorialSteps.advance({}, 1, "first") == 1, "Empty tutorial stays complete")
print("6 tutorial checks passed")

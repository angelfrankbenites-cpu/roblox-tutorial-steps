--!strict
local TutorialSteps = require(script.Parent.TutorialSteps)

local steps: { TutorialSteps.Step } = {
	{ id = "FirstCheckpoint", text = "Acércate al primer punto y actívalo." },
	{ id = "SecondCheckpoint", text = "Activa el segundo punto para terminar." },
}

return {
	attribute = "TutorialStep",
	steps = steps,
	completeText = "¡Tutorial completado!",
}

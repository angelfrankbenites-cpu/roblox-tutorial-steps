--!strict
export type Step = { id: string, text: string }

local TutorialSteps = {}

function TutorialSteps.advance(steps: { Step }, current: number, completedId: string): number
	local step = steps[current]
	if step == nil or step.id ~= completedId then
		return current
	end
	return current + 1
end

return TutorialSteps

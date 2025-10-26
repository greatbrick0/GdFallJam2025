extends GPUParticles2D


func Enable():
	$".".emitting = true
	$CPUParticles2D.emitting = true
	
	

func Disable():
	$".".emitting = false
	$CPUParticles2D.emitting = false

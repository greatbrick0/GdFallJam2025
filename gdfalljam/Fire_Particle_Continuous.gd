extends GPUParticles2D


func enable():
	$".".emitting = true;
	$GPUParticles2D.emitting = true;
	
func Disable():
	$".".emitting = false;
	$GPUParticles2D.emitting = false;

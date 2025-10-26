extends GPUParticles2D


func Enable():
	$".".emitting = true
	$GPUParticles2D.emitting = true
	if ($Timer.is_instance_valid()):
		$Timer.start()
	
	

func Disable():
	$".".emitting = false
	$GPUParticles2D.emitting = false


func _on_timer_timeout():
	$".".queue_free()

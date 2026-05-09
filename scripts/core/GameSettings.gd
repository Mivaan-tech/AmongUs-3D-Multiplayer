extends Resource
class_name GameSettings

# Player Settings
@export var player_speed: float = 1.5
@export var player_size: float = 1.0
@export var sensitivity_mouse: float = 0.5

# Impostor Settings
@export var kill_cooldown: float = 30.0
@export var kill_range: float = 1.0

# Meeting Settings
@export var meeting_duration: float = 60.0
@export var discussion_time: float = 15.0

# Game Settings
@export var max_game_duration: float = 3600.0
@export var max_players: int = 15
@export var impostor_count: int = 1

# Role Enabled Toggles
@export var engineer_enabled: bool = true
@export var scientist_enabled: bool = true
@export var sheriff_enabled: bool = true
@export var medic_enabled: bool = true
@export var guardian_angel_enabled: bool = true
@export var jester_enabled: bool = true
@export var arsonist_enabled: bool = true
@export var shapeshifter_enabled: bool = true
@export var phantom_enabled: bool = true

# Role-Specific Settings
@export var engineer_vent_cooldown: float = 10.0
@export var scientist_vitals_cooldown: float = 10.0
@export var sheriff_max_shots: int = 1
@export var medic_shield_duration: float = 30.0
@export var shapeshifter_duration: float = 15.0
@export var shapeshifter_cooldown: float = 30.0
@export var phantom_duration: float = 5.0
@export var phantom_cooldown: float = 20.0
@export var arsonist_dousing: float = 60.0

# Touchscreen Settings
@export var touchscreen_enabled: bool = true
@export var joystick_sensitivity: float = 1.0
@export var button_size: float = 100.0

# Laptop Settings
@export var laptop_fov: float = 60.0
@export var laptop_position: Vector3 = Vector3(5, 0, 5)

func is_role_enabled(role_type: String) -> bool:
	match role_type:
		"Engineer":
			return engineer_enabled
		"Scientist":
			return scientist_enabled
		"Sheriff":
			return sheriff_enabled
		"Medic":
			return medic_enabled
		"GuardianAngel":
			return guardian_angel_enabled
		"Jester":
			return jester_enabled
		"Arsonist":
			return arsonist_enabled
		"Shapeshifter":
			return shapeshifter_enabled
		"Phantom":
			return phantom_enabled
		_:
			return true

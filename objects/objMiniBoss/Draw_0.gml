/// @description Insert description here
// You can write your code in this editor
if (state != m_states.revving) {
	draw_self();
} else {
	draw_sprite(sprite_index,image_index,x+irandom_range(-6,6),y+irandom_range(-6,6));
}
switch (state) {
	case m_states.movingforwardlong: draw_text(x,y+32,"moving forward long"); break;
	case m_states.walkingforward:    draw_text(x,y+32,"moving forward");	  break;
	case m_states.walkingback:		 draw_text(x,y+32,"walkingback");		  break;
	case m_states.shooting:			 draw_text(x,y+32,"shooting");			  break;
	case m_states.shootingfast:		 draw_text(x,y+32,"shooting fast");		  break;
	case m_states.pausing :			 draw_text(x,y+32,"pausing");		      break;
}
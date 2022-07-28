#ifndef _HARDWARE_ABSTRACTION_H_
#define _HARDWARE_ABSTRACTION_H_

/* API exported to Ada/SPARK */

enum LEDColor {OFF = 0, RED = 1, GREEN = 2, BLUE = 3};

void set_led_color(enum LEDColor color);

void __gnat_last_chance_handler (void);

/* API imported from Ada/SPARK */

extern uint32_t generate_page(void *page_buffer, uint32_t buffer_size);

extern void Ada_Codeinit(void);

#endif /* ! _HARDWARE_ABSTRACTION_H_ */

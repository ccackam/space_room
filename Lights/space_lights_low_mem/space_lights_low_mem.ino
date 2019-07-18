#define T1H  1000    // Width of a 1 bit in ns
#define T1L  600    // Width of a 1 bit in ns
#define T0H  450    // Width of a 0 bit in ns
#define T0L  750    // Width of a 0 bit in ns
#define RES 6000    // Width of the low gap between bits to cause a frame to latch

#define NS_PER_SEC (1000000000L)
#define CYCLES_PER_SEC (F_CPU)
#define NS_PER_CYCLE ( NS_PER_SEC / CYCLES_PER_SEC )
#define NS_TO_CYCLES(n) ( (n) / NS_PER_CYCLE )

class led_strip
{
  public:
    int pixels;
    int pin;

    led_strip(int PIXELS, int PIN)
    {
      pixels = PIXELS;
      pin = PIN;
    }

};

// Low Level
inline void sendBit( bool bitVal , led_strip this_strip) {
  switch (this_strip.pin) {
    case 0:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (0),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (0),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 1:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (1),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (1),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 2:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (2),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (2),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 3:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (3),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (3),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 4:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (4),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (4),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 5:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (5),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (5),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 6:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (6),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (6),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 7:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (7),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (7),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 8:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (0),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (0),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 9:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (1),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (1),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 10:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (2),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTD)),
          [bit]   "I" (0),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 11:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (3),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (3),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 12:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (4),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (4),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
    case 13:
      if (  bitVal ) {        // 0 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"                                // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (5),
          [onCycles]  "I" (NS_TO_CYCLES(T1H) - 2),    // 1-bit width less overhead  for the actual bit setting, note that this delay could be longer and everything would still work
          [offCycles]   "I" (NS_TO_CYCLES(T1L) - 2)     // Minimum interbit delay. Note that we probably don't need this at all since the loop overhead will be enough, but here for correctness

        );

      } 
      else {                  // 1 bit

        asm volatile (
          "sbi %[port], %[bit] \n\t"        // Set the output bit
          ".rept %[onCycles] \n\t"        // Now timing actually matters. The 0-bit must be long enough to be detected but not too long or it will be a 1-bit
          "nop \n\t"                                              // Execute NOPs to delay exactly the specified number of cycles
          ".endr \n\t"
          "cbi %[port], %[bit] \n\t"                              // Clear the output bit
          ".rept %[offCycles] \n\t"                               // Execute NOPs to delay exactly the specified number of cycles
          "nop \n\t"
          ".endr \n\t"
          ::
          [port]    "I" (_SFR_IO_ADDR(PORTB)),
          [bit]   "I" (5),
          [onCycles]  "I" (NS_TO_CYCLES(T0H) - 2),
          [offCycles] "I" (NS_TO_CYCLES(T0L) - 2)

        );
      }
      break;
  }


}
inline void sendByte( unsigned char byte , led_strip this_strip) {

  for ( unsigned char bit = 0 ; bit < 8 ; bit++ ) {

    sendBit( bitRead( byte , 7 ), this_strip);                // Neopixel wants bit in highest-to-lowest order
    // so send highest bit (bit #7 in an 8-bit byte since they start at 0)
    byte <<= 1;                                    // and then shift left so bit 6 moves into 7, 5 moves into 6, etc

  }
}
void ledsetup(led_strip this_strip) {
  switch(this_strip.pin){
    case 0:
      bitSet( DDRD , 0 );
      break;
    case 1:
      bitSet( DDRD , 1 );
      break;
    case 2:
      bitSet( DDRD , 2 );
      break;
    case 3:
      bitSet( DDRD , 3 );
      break;
    case 4:
      bitSet( DDRD , 4 );
      break;
    case 5:
      bitSet( DDRD , 5 );
      break;
    case 6:
      bitSet( DDRD , 6 );
      break;
    case 7:
      bitSet( DDRD , 7 );
      break;
    case 8:
      bitSet( DDRB , 0 );
      break;
    case 9:
      bitSet( DDRB , 1 );
      break;
    case 10:
      bitSet( DDRB , 2 );
      break;
    case 11:
      bitSet( DDRB , 3 );
      break;
    case 12:
      bitSet( DDRB , 4 );
      break;
    case 13:
      bitSet( DDRB , 5 );
      break;
  }
}
inline void sendPixel( unsigned char r, unsigned char g , unsigned char b , led_strip this_strip)  {

  sendByte(g, this_strip);          // Neopixel wants colors in green then red then blue order
  sendByte(r, this_strip);
  sendByte(b, this_strip);

}

// Mid Level
void show() {
  _delay_us( (RES / 1000UL) + 1);       // Round up since the delay must be _at_least_ this long (too short might not work, too long not a problem)
}
void showColor( unsigned char r , unsigned char g , unsigned char b , led_strip this_strip) {

  cli();
  for ( int p = 0; p < this_strip.pixels; p++ ) {
    sendPixel( r , g , b , this_strip);
  }
  sei();
  show();

}

// User Interface
void colorWipe(unsigned char r , unsigned char g, unsigned char b, unsigned  char wait, led_strip this_strip ) {

  for (unsigned int i = 0; i < this_strip.pixels; i += (this_strip.pixels / 60) ) {

    cli();
    unsigned int p = 0;

    while (p++ <= i) {
      sendPixel(r, g, b, this_strip);
    }

    while (p++ <= this_strip.pixels) {
      sendPixel(0, 0, 0, this_strip);

    }

    sei();
    show();
    delay(wait);
  }
}
void theaterChase( unsigned char r , unsigned char g, unsigned char b, unsigned char wait , led_strip this_strip) {

  int THEATER_SPACING = (this_strip.pixels/20);

  for (int j = 0; j < 3 ; j++) {

    for (int q = 0; q < THEATER_SPACING ; q++) {

      unsigned int step = 0;

      cli();

      for (int i = 0; i < this_strip.pixels ; i++) {

        if (step == q) {

          sendPixel( r , g , b, this_strip );

        } else {

          sendPixel( 0 , 0 , 0, this_strip );

        }

        step++;

        if (step == THEATER_SPACING) step = 0;

      }

      sei();

      show();
      delay(wait);

    }

  }

}
void rainbowCycle(unsigned char frames , unsigned int frameAdvance, unsigned int pixelAdvance, led_strip this_strip ) {

  // Hue is a number between 0 and 3*256 than defines a mix of r->g->b where
  // hue of 0 = Full red
  // hue of 128 = 1/2 red and 1/2 green
  // hue of 256 = Full Green
  // hue of 384 = 1/2 green and 1/2 blue
  // ...

  unsigned int firstPixelHue = 0;     // Color for the first pixel in the string

  for (unsigned int j = 0; j < frames; j++) {

    unsigned int currentPixelHue = firstPixelHue;

    cli();

    for (unsigned int i = 0; i < this_strip.pixels; i++) {

      if (currentPixelHue >= (3 * 256)) {              // Normalize back down incase we incremented and overflowed
        currentPixelHue -= (3 * 256);
      }

      unsigned char phase = currentPixelHue >> 8;
      unsigned char step = currentPixelHue & 0xff;

      switch (phase) {

        case 0:
          sendPixel( ~step , step ,  0 , this_strip);
          break;

        case 1:
          sendPixel( 0 , ~step , step, this_strip);
          break;

        case 2:
          sendPixel(  step , 0 , ~step, this_strip);
          break;

      }

      currentPixelHue += pixelAdvance;


    }

    sei();

    show();

    firstPixelHue += frameAdvance;

  }
}
void detonate( unsigned char r , unsigned char g , unsigned char b , unsigned int startdelayms, led_strip this_strip) {
  while (startdelayms) {

    showColor( r , g , b , this_strip);      // Flash the color
    showColor( 0 , 0 , 0 , this_strip);

    delay( startdelayms );

    startdelayms =  ( startdelayms * 4 ) / 5 ;           // delay between flashes is halved each time until zero

  }

  // Then we fade to black....

  for ( int fade = 256; fade > 0; fade-- ) {

    showColor( (r * fade) / 256 , (g * fade) / 256 , (b * fade) / 256 , this_strip);

  }

  showColor( 0 , 0 , 0 , this_strip);
}


void binary(unsigned char r , unsigned char g , unsigned char b , unsigned int zero , unsigned int one , bool dir, led_strip &this_strip, int &end_pixel, bool &start_type, int &start_count)
{
    bool type = start_type;
    int count = start_count;

    if (!dir && first)
    {
      
      end_pixel = this_strip.pixels;
      count = 5;
      first = 0;
    }
    else if(first)
    {
      count = 0;
      first = 0;
    }

    cli();
    for(int pix = 0; pix < this_strip.pixels; pix++ )
    {
      if(dir && pix <= end_pixel)
      {
        if(type)
        {
          sendPixel( r , g , b, this_strip );
          if(count <= 0)
          {
            type = 0; //
            count = zero;
          }
          else if(count > 0)
          {
            count--;
          }
        }
        else
        {
          sendPixel( 0 , 0 , 0, this_strip );
          if(count <= 0)
          {
            type = 1;//
            count = one;
          }
          else if(count > 0)
          {
            count--;
          }
        }
      }
      else if (!dir && pix >= end_pixel)//
      {
        if(type)
        {
          sendPixel( r , g , b, this_strip );
          if(count <= 0)
          {
            type = 0;
            count = zero;
          }
          else if(count > 0)
          {
            count--;
          }
        }
        else
        {
          sendPixel( 0 , 0 , 0, this_strip );
          if(count <= 0)
          {
            type = 1;
            count = one;
          }
          else if(count > 0)
          {
            count--;
          }
        }
      }
      else
      {
        if(dir)
        {
          if(type)
          {
            if(count <= 0)
            {
              type = 0; //
              count = zero;
            }
            else if(count > 0)
            {
              count--;
            }
          }
          else
          {
            if(count <= 0)
            {
              type = 1;//
              count = one;
            }
            else if(count > 0)
            {
              count--;
            }
          }
        }
        else
        {
          if(type)
          {
            if(count <= 0)
            {
              type = 0;
              count = zero;
            }
            else if(count > 0)
            {
              count--;
            }
          }
          else
          {
            if(count <= 0)
            {
              type = 1;
              count = one;
            }
            else if(count > 0)
            {
              count--;
            }
          }
        }
        sendPixel( 0 , 0 , 0, this_strip );
      } 
//      Serial.println(count);     
    }
    
    if (dir && end_pixel < this_strip.pixels)
    {
      end_pixel++;
    }
    else if(!dir && end_pixel > 0)
    {
     end_pixel--; 
    }
    
    if(start_type)
    {
      if(dir && start_count >= one)
      {
        start_type = 0;//
        start_count = 0;
      }
      else if(dir && start_count < one)
      {
        start_count++;
      }
      else if(!dir && start_count <= 0)
      {
        start_type = 0;
        start_count = zero;
      }
      else if(!dir && start_count > 0)
      {
        start_count--;
      }
    }
    else
    {
      if(dir && start_count >= zero)
      {
        start_type = 1;//
        start_count = 0;
      }
      else if(dir && start_count < zero)
      {
        start_count++;
      }
      else if(!dir && start_count <= 0)
      {
        start_type = 1;
        start_count = one;
      }
      else if(!dir && start_count > 0)
      {
        start_count--;
      }
    }
    sei();
}

void execute_telleport(unsigned char r, unsigned char g, unsigned char b, int &index, led_strip this_strip)
{

int section_start = 0;
int section_stop = 1400;

  switch(index)
  {
    case 0:
      section_start = 0;
      section_stop = 100;
      break;
    case 1:
      section_start = 100;
      section_stop = 200;
      break;
    case 2:
      section_start = 200;
      section_stop = 300;
      break;
    case 3:
      section_start = 300;
      section_stop = 400;
      break;
    case 4:
      section_start = 400;
      section_stop = 500;
      break;
    case 5:
      section_start = 500;
      section_stop = 600;
      break;
    case 6:
      section_start = 600;
      section_stop = 700;
      break;
    case 7:
      section_start = 700;
      section_stop = 800;
      break;
    case 8:
      section_start = 800;
      section_stop = 900;
      break;
    case 9:
      section_start = 900;
      section_stop = 1000;
      break;
    case 10:
      section_start = 1000;
      section_stop = 1100;
      break;
    case 11:
      section_start = 1100;
      section_stop = 1200;
      break;
    case 12:
      section_start = 1200;
      section_stop = 1300;
      break;
    case 13:
      section_start = 1300;
      section_stop = 1400;
      break;
    default:
      section_start = 0;
      section_stop = 1400;
      break;
  }

  for(int i = 0; i<this_strip.pixels; i++)
  {
    if(section_start>i || i>=section_stop)
    {
      sendPixel(0,0,0,this_strip)
    }
    else
    {
      sendPixel(r,g,b,this_strip)
    }
  }
  
  if(index >= 14)
  {
    index = 0;
  }
  else
  {
    index++;
  }
}

// Main
led_strip main_lights = led_strip(322,0);
led_strip wall_circuit_1 = led_strip(76,6);
led_strip wall_circuit_2 = led_strip(67,7);
led_strip wall_circuit_3_1 = led_strip(138,9);
led_strip wall_circuit_3_2 = led_strip(148,13);
led_strip wall_circuit_3_3 = led_strip(98,8);
led_strip wall_circuit_4 = led_strip(733,5);
led_strip telleport = led_strip(776,12);
led_strip stairs = led_strip(181,11);

int end_pixel_1 = 0;
bool start_type_1 = 1;
int start_count_1 = 0;

int end_pixel_2 = wall_circuit_2.pixels;
bool start_type_2 = 1;
int start_count_2 = 5;

int end_pixel_3_1 = 0;
bool start_type_3_1 = 1;
int start_count_3_1 = 0;

int end_pixel_3_2 = 0;
bool start_type_3_2 = 1;
int start_count_3_2 = 0;

int end_pixel_3_3 = 0;
bool start_type_3_3 = 1;
int start_count_3_3 = 0;

int end_pixel_4 = 0;
bool start_type_4 = 1;
int start_count_4 = 0;

int end_pixel_stiars = 0;
bool start_type_stiars = 1;
int start_count_stiars = 0;

int telleport_index = 0;

int state = 0;

void setup() 
{
  

  cli();
  
  ledsetup(main_lights);
  ledsetup(wall_circuit_1);
  ledsetup(wall_circuit_2);
  ledsetup(wall_circuit_3_1);
  ledsetup(wall_circuit_3_2);
  ledsetup(wall_circuit_3_3);
  ledsetup(wall_circuit_4);
  ledsetup(telleport);
  ledsetup(stairs);

  showColor(0,0,0,main_lights);
  showColor(0,0,0,wall_circuit_1);
  showColor(0,0,0,wall_circuit_2);
  showColor(0,0,0,wall_circuit_3_1);
  showColor(0,0,0,wall_circuit_3_2);
  showColor(0,0,0,wall_circuit_3_3);
  showColor(0,0,0,wall_circuit_4);
  showColor(0,0,0,telleport);
  showColor(0,0,0,stairs);
  
  show();
  delay(200);
}

void loop() 
{
    // Recive State
  
    switch(state)
    {
      case 0:
        binary(0,0,50,5,5,0,stairs, end_pixel_stairs, start_type_stairs, start_count_stairs);
        break;
    }
    
    binary(0,0,50,5,5,1,middle_1, end_pixel_1, start_type_1, start_count_1);
    
    if(end_pixel_1 >= middle_1.pixels)
    {
      binary(0,0,50,5,5,0,middle_2, end_pixel_2, start_type_2, start_count_2);
      if(end_pixel_2 <= 0)
      {
        binary(0,0,50,5,5,1,middle_3_1, end_pixel_3_1, start_type_3_1, start_count_3_1);
        binary(0,0,50,5,5,1,middle_3_2, end_pixel_3_2, start_type_3_2, start_count_3_2);
        binary(0,0,50,5,5,1,middle_3_3, end_pixel_3_3, start_type_3_3, start_count_3_3;
        if(end_pixel_3_2 == middle_3_2.pixels)
        {
          binary(0,0,50,5,5,1,middle_4, end_pixel_4, start_type_4, start_count_4, first_4);
        }
        else
        {
          delay(50);
        }
      }
      else
      {
        delay(80);
      }
    }
    else
    {
      delay(90);
    }

    show();
    
//    binary(0,0,50,5,5,0,stairs, end_pixel_stairs, start_type_stairs, start_count_stairs);
//    show();
//    delayMicroseconds(225);

//    showColor(0,0,50,middle_1);
//    delay(500);

}

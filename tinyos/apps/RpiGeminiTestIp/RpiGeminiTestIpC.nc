/* Run this app on the RPi to generate to test the Gemini power meter
 * against ground truth.
 *
 * @author: Brad Campbell <bradjc@umich.edu>
 */

configuration RpiGeminiTestIpC {}
implementation {
  components MainC;
  components RpiGeminiTestIpP as App;
  components LedsC;

  App.Boot -> MainC.Boot;
  App.Leds -> LedsC;

  // IPv6 Stack
  components IPStackC;
  components StaticIPAddressC;
  App.BlipControl -> IPStackC.SplitControl;

  components UartC;
  App.UartBuffer -> UartC.UartBuffer;

  components CalibrateBorderC;
}

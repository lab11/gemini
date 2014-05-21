
module RpiGeminiTestIpP {
  uses {
    interface Boot;
    interface Leds;

    interface SplitControl as BlipControl;

    interface UartBuffer;
  }
}
implementation {

  event void Boot.booted() {
    call BlipControl.start();
  }

  event void BlipControl.startDone (error_t err) {
    if (err != SUCCESS) {
      call BlipControl.start();
    }
  }

  event void UartBuffer.receive (uint8_t* buf,
                                 uint8_t len,
                                 uint64_t timestamp) {
    buf[len] = '\0';
    printf("plm: %llu %s", timestamp, buf);
  }

  event void BlipControl.stopDone (error_t err) { }
}

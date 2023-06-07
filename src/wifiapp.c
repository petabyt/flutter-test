#include "wifiapp.h"

#include <camlib.h>
#include <fuji.h>

FFI_PLUGIN_EXPORT const char * test() {
   	struct PtpRuntime r;
	ptp_generic_init(&r);
	r.connection_type = PTP_IP;

	if (ptpip_connect(&r, "192.168.0.1", FUJI_CMD_IP_PORT)) {
        return "Connection failure";
	} else {
	    return "Connected";
	}
}


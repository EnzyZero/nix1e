#include <linux/module.h>
#include <linux/reboot.h>
#include <linux/surface_aggregator/controller.h>

static struct sys_off_handler *surface_ec_restart_handler;

static int surface_ec_restart(struct sys_off_data *data) {
    struct ssam_controller *ctrl = ssam_get_controller();
	struct ssam_request req = {
		.target_category = 0x01,
		.target_id       = 0x01,
		.command_id      = 0x14,
		.instance_id     = 0x00,
	};

	if (ctrl) ssam_request_do_sync(ctrl, &req, NULL);
	return NOTIFY_DONE;
}

static int __init surface_ec_restart_init(void) {
    surface_ec_restart_handler = register_sys_off_handler(
        SYS_OFF_MODE_RESTART,
        SYS_OFF_PRIO_HIGH,
        surface_ec_restart,
        NULL
    );

    return PTR_ERR_OR_ZERO(surface_ec_restart_handler);
}

static void __exit surface_ec_restart_exit(void) {
    unregister_sys_off_handler(surface_ec_restart_handler);
}

module_init(surface_ec_restart_init)
module_exit(surface_ec_restart_exit)

MODULE_LICENSE("GPL");

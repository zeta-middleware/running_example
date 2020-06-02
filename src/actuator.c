#include <logging/log.h>
#include <zephyr.h>
#include <zeta.h>

LOG_MODULE_DECLARE(zeta, CONFIG_ZETA_LOG_LEVEL);

K_SEM_DEFINE(ACTUATOR_callback_sem, 0, 1);

void ACTUATOR_service_callback(zt_channel_e id)
{
    k_sem_give(&ACTUATOR_callback_sem);
}

void ACTUATOR_task()
{
    LOG_DBG("ACTUATOR Service has started...[OK]");
    zt_data_t *act_cmd = ZT_DATA_U8(0);
    while (1) {
        k_sem_take(&ACTUATOR_callback_sem, K_FOREVER);
        zt_chan_read(ZT_ACT_CHANNEL, act_cmd);
        if (act_cmd->u8.value == 0) {
            LOG_WRN("Actuator turning OFF");
        } else {
            LOG_WRN("Actuator turning ON");
        }
    }
}

ZT_SERVICE_INIT(ACTUATOR, ACTUATOR_task, ACTUATOR_service_callback);

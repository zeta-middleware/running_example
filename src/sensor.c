#include <logging/log.h>
#include <zephyr.h>
#include <zeta.h>

LOG_MODULE_DECLARE(zeta, CONFIG_ZETA_LOG_LEVEL);

K_SEM_DEFINE(SENSOR_callback_sem, 0, 1);


void SENSOR_service_callback(zt_channel_e id)
{
    k_sem_give(&SENSOR_callback_sem);
}

u64_t sensor_data_generate()
{
    return (u64_t) k_uptime_get();
}

void SENSOR_task()
{
    LOG_DBG("SENSOR Service has started...[OK]");
    while (1) {
        k_sleep(K_SECONDS(2));
        LOG_DBG("Publishing data to SENSOR_DATA");

        u32_t cycles = k_cycle_get_32();
        LOG_DBG("Publishing at %u cycles.", cycles);
        zt_chan_pub(ZT_SENSOR_DATA_CHANNEL, ZT_DATA_U64(sensor_data_generate()));
    }
}

ZT_SERVICE_INIT(SENSOR, SENSOR_task, SENSOR_service_callback);

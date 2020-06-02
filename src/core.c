#include <logging/log.h>
#include <zephyr.h>
#include <zeta.h>

LOG_MODULE_DECLARE(zeta, CONFIG_ZETA_LOG_LEVEL);

K_SEM_DEFINE(CORE_callback_sem, 0, 1);

void CORE_service_callback(zt_channel_e id)
{
    u32_t cycles = k_cycle_get_32();
    LOG_DBG("Callback react at %u cycles.", cycles);
    k_sem_give(&CORE_callback_sem);
}

void CORE_task()
{
    zt_data_t *sensor_data = ZT_DATA_BYTES(8, 0);
    LOG_DBG("CORE Service has started...[OK]");

    /* version's data scope. Remove it after using it */ {
        zt_data_t *version = ZT_DATA_BYTES(2, 0);
        zt_chan_read(ZT_FIRMWARE_VERSION_CHANNEL, version);
        LOG_DBG("Firmware version v%u.%u", version->bytes.value[1],
                version->bytes.value[0]);
    }
    u8_t condition = 0;
    while (1) {
        k_sem_take(&CORE_callback_sem, K_FOREVER);
        zt_chan_read(ZT_SENSOR_DATA_CHANNEL, sensor_data);
        condition = (sensor_data->u64.value & 0x10) == 0x10;
        LOG_DBG("Checking condition 0x%llx & 0x10 = %d", sensor_data->u64.value,
                condition);
        zt_chan_pub(ZT_ACT_CHANNEL, ZT_DATA_U8(condition));
    }
}

ZT_SERVICE_INIT(CORE, CORE_task, CORE_service_callback);

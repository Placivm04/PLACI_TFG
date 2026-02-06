library(dplyr)
library(readr)

# Vamos a analizar los CSV's de los datasets. Miraremos cuales son los ataques que identifica

# ----------------------------
# *** DATASET CIC-IDS-2017 ***
# ----------------------------

datos_lunes <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/CIC-IDS-2017/Monday-WorkingHours.pcap_ISCX.csv")
datos_martes <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/CIC-IDS-2017/Tuesday-WorkingHours.pcap_ISCX.csv")
datos_miercoles <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/CIC-IDS-2017/Wednesday-workingHours.pcap_ISCX.csv")
datos_jueves_morning <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/CIC-IDS-2017/Thursday-WorkingHours-Morning-WebAttacks.pcap_ISCX.csv")
datos_jueves_afternoon <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/CIC-IDS-2017/Thursday-WorkingHours-Afternoon-Infilteration.pcap_ISCX.csv")
datos_viernes_morning <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/CIC-IDS-2017/Friday-WorkingHours-Morning.pcap_ISCX.csv")
datos_viernes_afternoon_DDos <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/CIC-IDS-2017/Friday-WorkingHours-Afternoon-DDos.pcap_ISCX.csv")
datos_viernes_afternoon_PortScan <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/CIC-IDS-2017/Friday-WorkingHours-Afternoon-PortScan.pcap_ISCX.csv")

# VEMOS LAS ETIQUETAS Y EL NUMERO DE MUESTRAS

table(datos_lunes$Label)
table(datos_martes$Label)
table(datos_miercoles$Label)
table(datos_jueves_morning$Label)
table(datos_jueves_afternoon$Label)
table(datos_viernes_morning$Label)
table(datos_viernes_afternoon_DDos$Label)
table(datos_viernes_afternoon_PortScan$Label)

todos <- bind_rows(
  lunes = datos_lunes,
  martes = datos_martes,
  miercoles = datos_miercoles,
  jueves_morning = datos_jueves_morning,
  jueves_afternoon = datos_jueves_afternoon,
  viernes_morning = datos_viernes_morning,
  viernes_ddos = datos_viernes_afternoon_DDos,
  viernes_portscan = datos_viernes_afternoon_PortScan,
  .id = "dataset"
)

tabla_completa <- todos %>%
  count(Label, name = "Total") %>%
  arrange(desc(Total))

tabla_completa

# *** DATASET NUSW-NB_15 ****

datos_test_NUSW <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/NUSW-NB15/UNSW_NB15_testing-set.csv")
datos_train_NUSW <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/NUSW-NB15/UNSW_NB15_training-set.csv")

unsw_todos <- bind_rows(
  train = datos_train_NUSW,
  test  = datos_test_NUSW,
  .id = "dataset"
)

# VEMOS LAS ETIQUETAS Y EL NUMERO DE MUESTRAS

unsw_todos %>%
  mutate(clase = ifelse(label == 0, "BENIGN", "ATTACK")) %>%
  count(clase)

tabla_completa_unsw <- bind_rows(
  unsw_todos %>%
    filter(label == 0) %>%
    summarise(Clase = "BENIGN", Total = n()),
  
  unsw_todos %>%
    filter(label == 1) %>%
    count(Clase = attack_cat, name = "Total")
) %>%
  arrange(desc(Total))

tabla_completa_unsw

# -----------------------
# *** DATASET TON_IoT ***
# -----------------------

datos_TON_IoT <- read.csv("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/TON_IoT/train_test_network.csv")

# VEMOS LAS ETIQUETAS Y EL NUMERO DE MUESTRAS

datos_TON_IoT %>%
  mutate(clase = ifelse(label == 0, "BENIGN", "ATTACK")) %>%
  count(clase)

tabla_completa_ton <- bind_rows(
  datos_TON_IoT %>%
    filter(label == 0) %>%
    summarise(Clase = "BENIGN", Total = n()),
  
  datos_TON_IoT %>%
    filter(label == 1) %>%
    count(Clase = type, name = "Total")
) %>%
  arrange(desc(Total))

tabla_completa_ton

# ----------------------
# *** DATASET IOT-23 ***
# ----------------------

datos_IOT_23_1_1 <- read_table("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/IOT-23/capture-1-1.labeled", 
                    comment = "#", 
                    col_names = FALSE)

colnames(datos_IOT_23_1_1) <- c(
  "ts", "uid", "id.orig_h", "id.orig_p", "id.resp_h", "id.resp_p", 
  "proto", "service", "duration", "orig_bytes", "resp_bytes", 
  "conn_state", "local_orig", "local_resp", "missed_bytes", 
  "history", "orig_pkts", "orig_ip_bytes", "resp_pkts", 
  "resp_ip_bytes", "tunnel_parents", "label", "detailed-label"
)

datos_IOT_23_3_1 <- read_table("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Raw/IOT-23/capture-3-1.labeled", 
                               comment = "#", 
                               col_names = FALSE)

colnames(datos_IOT_23_3_1) <- c(
  "ts", "uid", "id.orig_h", "id.orig_p", "id.resp_h", "id.resp_p", 
  "proto", "service", "duration", "orig_bytes", "resp_bytes", 
  "conn_state", "local_orig", "local_resp", "missed_bytes", 
  "history", "orig_pkts", "orig_ip_bytes", "resp_pkts", 
  "resp_ip_bytes", "tunnel_parents", "label", "detailed-label"
)

iot23_unido <- bind_rows(
  cap_1_1 = datos_IOT_23_1_1,
  cap_3_1 = datos_IOT_23_3_1,
  .id = "captura_origen"
)

# VEMOS LAS ETIQUETAS Y EL NUMERO DE MUESTRAS
tabla_ataques_iot23 <- iot23_unido %>%
  group_by(label, `detailed-label`) %>%
  summarise(Total = n(), .groups = 'drop') %>%
  arrange(desc(Total))

print(tabla_ataques_iot23)

# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

# VEAMOS AHORA LAS RELACIONES ENTRE LOS FEATURES DE CIC-IDS-2017 y UNSW-NB-15

# Columnas para CIC-IDS-2017
cols_cic <- c("Flow.Duration", "Fwd.IAT.Mean", "Bwd.IAT.Mean", 
              "Total.Fwd.Packets", "Total.Backward.Packets", 
              "Total.Length.of.Fwd.Packets", "Total.Length.of.Bwd.Packets", 
              "Flow.Packets.s", "Fwd.Packet.Length.Mean", 
              "Bwd.Packet.Length.Mean", "SYN.Flag.Count", 
              "ACK.Flag.Count", "Label")

datos_lunes_redux <- datos_lunes %>%
  select(any_of(cols_cic))

datos_martes_redux <- datos_martes %>%
  select(any_of(cols_cic))

datos_miercoles_redux <- datos_miercoles %>%
  select(any_of(cols_cic))

datos_jueves_morning_redux <- datos_jueves_morning %>%
  select(any_of(cols_cic))

datos_jueves_afternoon_redux <- datos_jueves_afternoon %>%
  select(any_of(cols_cic))

datos_viernes_morning_redux <- datos_viernes_morning %>%
  select(any_of(cols_cic))

datos_viernes_afternoon_DDos_redux <- datos_viernes_afternoon_DDos %>%
  select(any_of(cols_cic))

datos_viernes_afternoon_PortScan_redux <- datos_viernes_afternoon_PortScan %>%
  select(any_of(cols_cic))


# Columnas para UNSW-NB15
cols_unsw <- c("dur", "sinpkt", "dinpkt", "spkts", "dpkts", 
               "sbytes", "dbytes", "rate", "smean", "dmean", 
               "synack", "ackdat", "attack_cat")

datos_test_NUSW_redux <- datos_test_NUSW %>%
  select(any_of(cols_unsw))

datos_train_NUSW_redux <- datos_train_NUSW %>%
  select(any_of(cols_unsw))



# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

# VEAMOS AHORA LAS RELACIONES ENTRE LOS FEATURES DE IOT-23 y TON_IoT

# Columnas para ToN_IoT
cols_ton <- c("src_ip", "src_port", "dst_ip", "dst_port", "proto", 
              "duration", "src_bytes", "dst_bytes", "src_pkts", 
              "dst_pkts", "conn_state", "label", "type")

datos_TON_IoT_redux <- datos_TON_IoT %>%
  select(any_of(cols_ton))

write.csv(datos_TON_IoT_redux, 
          file = file.path("/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Reducidos/ton_iot", "datos_TON_IoT_redux.csv"), 
          row.names = FALSE)

# Columnas para IoT-23
cols_iot23 <- c("id.orig_h", "id.orig_p", "id.resp_h", "id.resp_p", "proto", 
                "duration", "orig_bytes", "resp_bytes", "orig_pkts", 
                "resp_pkts", "conn_state", "label", "detailed-label")

datos_IOT_23_1_1_redux <- datos_IOT_23_1_1 %>%
  select(any_of(cols_iot23))


datos_IOT_23_1_1_redux <- datos_IOT_23_1_1_redux %>%
  mutate(`detailed-label` = ifelse(`detailed-label` == "-", "Normal", `detailed-label`))

datos_IOT_23_3_1_redux <- datos_IOT_23_3_1_redux %>%
  mutate(`detailed-label` = ifelse(`detailed-label` == "-", "Normal", `detailed-label`))

write.csv(datos_IOT_23_1_1_redux, "/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Reducidos/iot-23/datos_IOT_23_1_1_redux.csv")
write.csv(datos_IOT_23_3_1_redux, "/home/placi/Escritorio/TFG/PLACI_TFG/DATASETS/dataSets_Reducidos/iot-23/datos_IOT_23_3_1_redux.csv")

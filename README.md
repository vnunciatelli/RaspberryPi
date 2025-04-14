# Tutorial: Configuração de Dual Boot com Fallback Automático no Raspberry Pi

Este tutorial descreve como configurar um sistema de **dual boot** no Raspberry Pi com uma funcionalidade de **fallback automático**. Caso a partição principal falhe, o sistema tentará inicializar a partir de uma partição secundária.

## Etapas para Configuração

### 1. Preparação do Cartão SD

1. **Conecte o Cartão SD** ao Raspberry Pi ou ao seu computador.
2. **Formatação do Cartão SD**:
   - Crie três partições no cartão SD:
     - **Partição 1**: `/boot` (FAT32, 256MB)
     - **Partição 2**: `Root A` (ext4, 3GB)
     - **Partição 3**: `Root B` (ext4, restante do espaço).
3. **Clonagem da imagem rootfs.img** para as partições `Root A` e `Root B` usando ferramentas como `dd` ou `Etcher`.

---

### 2. Instalação de Scripts e Serviço Systemd

1. **Baixar os scripts necessários**:
   - Baixe o script de validação (`validate-boot.sh`) e o arquivo de serviço (`validate-boot.service`).
   
2. **Configurar o arquivo de serviço systemd**:
   - Copie o arquivo `validate-boot.service` para `/etc/systemd/system/`.
   
3. **Configurar o script de validação**:
   - Copie o script `validate-boot.sh` para `/usr/local/bin/`.
   
4. **Tornar o script executável**:
   ```bash
   sudo chmod +x /usr/local/bin/validate-boot.sh

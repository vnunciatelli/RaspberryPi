
### 2. **Código do Script de Validação (validate-boot.sh)**

Aqui está um exemplo simples de um script de validação para verificar a disponibilidade das partições:

```bash
#!/bin/bash

# Montar a partição Root A
mount /dev/mmcblk0p2 /mnt

# Verificar se a partição foi montada corretamente
if [ $? -eq 0 ]; then
    echo "Root A está ok. Inicializando o sistema..."
    exit 0
fi

# Caso a partição Root A falhe, tentar a partição Root B
echo "Root A falhou. Tentando Root B..."

mount /dev/mmcblk0p3 /mnt

if [ $? -eq 0 ]; then
    echo "Root B está ok. Inicializando o sistema..."
    exit 0
fi

# Se ambas as partições falharem, exibir erro
echo "Erro: Ambas as partições falharam. Sistema não pode inicializar."
exit 1

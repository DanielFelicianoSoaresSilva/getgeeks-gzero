# robot -l NONE -o NONE -r NONE tasks/Delorean.robot
# robot -d ./logs tests/

# Utilizando CLI
# robot -l NONE -o NONE -r NONE tasks/Delorean.robot
# robot -d ./logs -v BROWSER:chromium -v HEADLESS:False -i smoke tests/

# Utilizando PABOT
robot -l NONE -o NONE -r NONE tasks/Delorean.robot
pabot -d ./logs -v BROWSER:chromium -v HEADLESS:False tests/

# Corrigir erro das evidencias PABOT
# Apagar a pasta criada e criar uma nova pasta browser e screenshot
rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

# Copia e buscar dentro de logs e pabot results todos os arquivos que tem o .png e coloca tudo dentro da pasta screenshot
cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot






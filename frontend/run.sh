# robot -l NONE -o NONE -r NONE tasks/Delorean.robot
# robot -d ./logs tests/

# Utilizando CLI
# robot -l NONE -o NONE -r NONE tasks/Delorean.robot
# robot -d ./logs -v BROWSER:chromium -v HEADLESS:False -i smoke tests/

# Utilizando PABOT
robot -l NONE -o NONE -r NONE tasks/Delorean.robot
pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:False tests/
rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

# Copia e busca dentro de logs e pabot results todos os arquivos que tem o .png e coloca tudo dentro da pasta screenshot
cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot

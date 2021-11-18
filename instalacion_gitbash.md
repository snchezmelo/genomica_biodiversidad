<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
# Índice

- [Git Bash SDK](#git-bash-sdk)
    - [Instalación de Git Bash SDK](#instalación-de-git-bash-sdk)
    - [Instalación de herramientas en Git Bash SDK](#instalación-de-herramientas-en-git-bash-sdk)

<!-- markdown-toc end -->

---

# Git Bash SDK

## Instalación de Git Bash SDK

Descarge el ejecutable (exe) de [Git Bash
SDK](https://github.com/git-for-windows/build-extra/releases/tag/git-sdk-1.0.8)
y ejecute el archivo descargado.

![](./Imagenes/descarga_gitbash_SDK.png)

Siga las instrucciones del proceso de instalación, puede tardar algunos
minutos.

## Instalación de herramientas en Git Bash SDK

Haremos un ejemplo de instalación con `wget`. Esta es una herramienta
que usaremos para gestionar descargas desde la línea de comando. Git
Bash incluye una herramienta para manejar la instalación de paquetes en
algunos sistemas Linux (Arch) llamada `pacman`.

Para instalar `wget` usando `pacman` simplemente escribimos:

`pacman -S wget`

Cuando termines de instalar `wget` verá algo como esto:

![](./Imagenes/wget_instalado.png)

Esto ejecutará correctamente la instalación de `wget` siempre y cuando
éste se encuentre en la lista de repositorios accesibles para `pacman`.

Si necesita instalar otras herramientas que no están disponibles por
defecto, puede usar esta misma sintaxis :smiley:.

#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="P-NATS"
BIN_NAME="P-NATS"

INSTALL_BIN_DIR="/usr/local/bin"
INSTALL_LIB_DIR="/usr/local/lib/${PROJECT_NAME}"
SOURCE_DIR="${HOME}/${PROJECT_NAME}"

echo ""
echo "Starting uninstallation of ${PROJECT_NAME}..."
echo ""

if [[ -L "${INSTALL_BIN_DIR}/${BIN_NAME}" ]]; then
  echo "Removing symbolic link: ${INSTALL_BIN_DIR}/${BIN_NAME}"
  if [[ -w "${INSTALL_BIN_DIR}" ]]; then
    rm "${INSTALL_BIN_DIR}/${BIN_NAME}"
  else
    sudo rm "${INSTALL_BIN_DIR}/${BIN_NAME}"
  fi
fi

if [[ -d "${INSTALL_LIB_DIR}" ]]; then
  echo "Removing installed files and venv: ${INSTALL_LIB_DIR}"
  if [[ -w "$(dirname "${INSTALL_LIB_DIR}")" ]]; then
    rm -rf "${INSTALL_LIB_DIR}"
  else
    sudo rm -rf "${INSTALL_LIB_DIR}"
  fi
fi

if [[ -d "${SOURCE_DIR}" ]]; then
  echo "Removing source directory: ${SOURCE_DIR}"
  rm -rf "${SOURCE_DIR}"
fi

echo ""
echo "${PROJECT_NAME} has been uninstalled successfully."

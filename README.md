
![PNG LOGO](https://github.com/user-attachments/assets/e0fba218-6059-4c69-9d46-c9354e392b93)

#               Static Web App Hosting on Azure Storage Account

This project provisions an **Azure Storage Account** configured for **static website hosting**. It serves as the backend infrastructure for deploying and hosting a static web application, such as HTML/CSS/JS files, directly from Azure.

## 📁 Project Structure

```

📂 webapp
┣ 📜 index.html
┣ 📜 styles.css
┣ 📜 script.js
┣ 📄 README.md

````

## 🚀 Features

- Static website hosting via Azure Storage Account
- Integrated with Azure CDN (optional)
- Supports HTML, CSS, JS files
- Easy to update using Azure DevOps or AzCopy

## 🛠️ Technologies

- **Azure Blob Storage**
- **Terraform
- **Static Website Hosting**
- **Azure CLI**
- **AzCopy / DevOps Pipelines**
- **HTML/CSS/JS**

## 🔧 Setup Instructions

### 1. Create the Storage Account

Use Terraform or Azure CLI:

```bash
az storage account create \
  --name <yourStorageAccountName> \
  --resource-group <yourResourceGroup> \
  --location <yourRegion> \
  --sku Standard_LRS \
  --kind StorageV2 \
  --enable-static-website true \
  --index-document index.html \
  --error-document 404.html
````

### 2. Upload Files

```bash
az storage blob upload-batch \
  --account-name <yourStorageAccountName> \
  --source ./webapp \
  --destination '$web'
```

Or use `AzCopy`:

```bash
azcopy copy "./webapp/*" "https://<yourStorageAccountName>.blob.core.windows.net/\$web?<sas_token>" --recursive
```

### 3. Access the Site

Visit:

```
#https://<yourStorageAccountName>.z13.web.core.windows.net
```

## 📬 Contact

**Oluseyi Sunny-Okundia**
Cloud Engineer | YouTube: [Cloudforged with Seyi](https://www.youtube.com/@cloudforgedwithseyi)
📧 [oluseyi@cloudforgedacademy.ca](mailto:oluseyi@cloudforgedacademy.ca)

---

## 📄 License

MIT License. Use at your own discretion.

```

# LegaLario - Automatización de Despliegues Blue/Green en AWS

Este proyecto implementa un flujo completo de despliegue automatizado utilizando **GitHub Actions**, **AWS ECS**, **ECR**, **CodeDeploy** y un **Application Load Balancer (ALB)**. El despliegue sigue la estrategia **Blue/Green**, asegurando cero tiempo de inactividad al actualizar la aplicación.

---

## **Tecnologías Utilizadas**

1. **GitHub Actions**: Automatización del flujo CI/CD.
2. **AWS Elastic Container Service (ECS)**: Ejecución de tareas en Fargate.
3. **AWS Elastic Container Registry (ECR)**: Almacenamiento de imágenes Docker.
4. **AWS CodeDeploy**: Manejo de despliegues Blue/Green.
5. **Application Load Balancer (ALB)**: Gestión del tráfico entre los Target Groups (Blue y Green).
6. **Docker**: Construcción de la imagen de la aplicación.

---

## **Estructura del Proyecto**

- **index.html**: Página de bienvenida de NGINX.
- **Dockerfile**: Construcción de la imagen Docker.
- **GitHub Actions Workflow**: `.github/workflows/build-and-deploy.yml` automatiza el proceso CI/CD.
- **AppSpec.json**: Configuración necesaria para CodeDeploy (generado automáticamente en el workflow).

---

## **Funcionalidades Implementadas**

### **Automatización del Despliegue**
1. Construcción de la imagen Docker.
2. Publicación de la imagen en AWS ECR.
3. Configuración del archivo `appspec.json` requerido por CodeDeploy.
4. Despliegue automatizado en ECS con estrategia Blue/Green.

### **Blue/Green Deployment**
- **Blue**: Grupo de destino que actualmente maneja el tráfico.
- **Green**: Grupo de destino donde se despliega la nueva versión.
- CodeDeploy realiza la transición del tráfico del grupo Blue al Green automáticamente tras completar las validaciones.

### **Alta Disponibilidad**
- Clúster ECS configurado con múltiples subnets en diferentes zonas de disponibilidad.
- ALB asegura balanceo de tráfico y supervisa la salud de las tareas.

## **Bucket S3**
- **Nombre**: `legalario-appspec-bucket`
- Almacena el archivo `appspec.json` requerido por CodeDeploy.

---

## **Clúster ECS**
- **Nombre**: `LegaLarioCluster`
- Configurado para tareas Fargate.

---

## **Service ECS**
- **Nombre**: `LegaLarioService`
- Despliega tareas con alta disponibilidad.

---

## **Load Balancer**
- **Nombre**: `LegaLarioALB`
- Administra tráfico entre los Target Groups Blue y Green.

---

## **Cómo Usarlo**

### 1. Configura tus secretos en GitHub Actions:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

### 2. Realiza cambios en `index.html`:
```html
<h1>¡Hola, LegaLario!</h1>

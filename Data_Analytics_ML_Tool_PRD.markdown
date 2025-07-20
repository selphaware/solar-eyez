# Product Requirements Document (PRD): Solar Eyez Data Analytics and ML Interpreter

## 1. Overview
This PRD outlines the plan for developing **Solar Eyez**, a Python 3.10-based command-line interpreter for data scientists. Solar combines a traditional DOS-like interpreter with advanced data analytics and machine learning (ML) capabilities. It supports multiple data formats, exploratory data analysis (EDA), unsupervised learning, classification, regression, forecasting, and TensorFlow integration. The interpreter features a dynamic, context-aware prompt and customizable color schemes for an enhanced user experience.

---

## 2. Objectives
- Provide a seamless, interactive command-line interface for data scientists to perform data ingestion, EDA, and ML tasks.
- Support multiple data formats (CSV, JSON, etc.) and dynamic dataset management.
- Enable a modular architecture for extensibility and maintainability.
- Offer visually appealing, customizable color schemes for the interpreter interface.
- Integrate TensorFlow for advanced ML model development and deployment.
- Ensure the interpreter prompt dynamically reflects ingested datasets and generated features.

---

## 3. Functional Requirements

### 3.1. Core Interpreter
- **Language**: Python 3.10.
- **Command-Line Interface**:
  - Behaves like a standard DOS-like interpreter, supporting Python commands and scripts.
  - Custom prompt starting as `Solar >>>` and dynamically updating to reflect ingested datasets and generated features.
  - Multi-line input support for complex commands or scripts.
- **Color Schemes**:
  - Customizable, visually appealing color themes for prompts, outputs, and errors.
  - Default theme with high contrast (e.g., dark background with vibrant text colors).
  - Configurable via a settings file or command-line flags.

### 3.2. Data Ingestion
- **Supported Formats**:
  - CSV, JSON, Parquet, Excel, and SQL databases (via SQLAlchemy).
- **Commands**:
  - `read <file_path>`: Ingest data from specified file or database into a named dataset (e.g., `read abc.csv`).
  - Automatic detection of file format based on extension or metadata.
- **Dataset Management**:
  - Store datasets in memory with unique identifiers (e.g., `abc` for `abc.csv`).
  - Update prompt to display active datasets (e.g., `Solar [abc] >>>`).
  - Support for multiple datasets simultaneously.

### 3.3. Exploratory Data Analysis (EDA)
- **Commands**:
  - `describe <dataset>`: Summary statistics (mean, median, std, etc.).
  - `plot <dataset> <type>`: Generate visualizations (e.g., histogram, scatter, boxplot) using Matplotlib/Seaborn.
  - `corr <dataset>`: Correlation matrix with coefficients and p-values.
  - `missing <dataset>`: Report missing values and suggest imputation strategies.
- **Output**:
  - Tabular and graphical outputs styled with the active color scheme.
  - Save outputs to files (e.g., PNG for plots, CSV for tables).

### 3.4. Feature Engineering
- **Commands**:
  - `generate_features <dataset> <method>`: Create new features (e.g., polynomial, interaction terms, encodings).
  - `scale <dataset> <method>`: Apply scaling (e.g., StandardScaler, MinMaxScaler).
  - `encode <dataset> <column> <method>`: Encode categorical variables (e.g., one-hot, label encoding).
- **Dataset Tracking**:
  - New datasets created from feature engineering are assigned unique names (e.g., `abc_features`).
  - Prompt updates to include new datasets (e.g., `Solar [abc, abc_features] >>>`).

### 3.5. Machine Learning Capabilities
- **Unsupervised Learning**:
  - Commands: `cluster <dataset> <method>` (e.g., KMeans, DBSCAN).
  - Visualization of clusters using PCA or t-SNE.
- **Classification**:
  - Commands: `classify <dataset> <target> <method>` (e.g., Logistic Regression, Random Forest, SVM).
  - Output: Model performance metrics (accuracy, precision, recall, F1-score).
- **Regression**:
  - Commands: `regress <dataset> <target> <method>` (e.g., Linear Regression, Random Forest).
  - Output: Model performance metrics (R², MSE, MAE).
- **Forecasting**:
  - Commands: `forecast <dataset> <target> <method>` (e.g., ARIMA, Prophet).
  - Support for time-series data with look-ahead predictions.
  - Output: Forecast plots and evaluation metrics.
- **TensorFlow Integration**:
  - Commands: `tf_model <dataset> <architecture>` (e.g., build and train neural networks).
  - Support for custom model definitions and pre-trained models.
  - Save/load models for reuse.

### 3.6. Reporting
- **Correlation Report**:
  - Generate a detailed report with correlation coefficients and p-values for all numeric columns.
- **Model Evaluation**:
  - Comprehensive reports for ML models, including confusion matrices, ROC curves, and feature importance.
- **Export**:
  - Save reports as Markdown, PDF, or HTML.

### 3.7. Prompt System
- **Dynamic Prompt**:
  - Default: `Solar >>>`.
  - Updates with dataset names upon ingestion (e.g., `Solar [abc] >>>`).
  - Reflects new datasets from feature engineering (e.g., `Solar [abc, abc_features] >>>`).
- **Multi-Line Support**:
  - Allow multi-line input for complex commands (e.g., defining TensorFlow models).
  - Visual indicator for multi-line mode (e.g., `...` continuation prompt).

---

## 4. Non-Functional Requirements
- **Performance**:
  - Optimize for large datasets (e.g., use Pandas with chunking for CSV reading).
  - Efficient memory management for multiple datasets.
- **Extensibility**:
  - Modular architecture to allow adding new ML methods or data formats.
- **Usability**:
  - Intuitive command syntax with tab-completion and command history.
  - Comprehensive help system (`help <command>`).
- **Compatibility**:
  - Fully compatible with Python 3.10 and standard libraries (Pandas, NumPy, Scikit-learn, TensorFlow).
- **Visual Appeal**:
  - High-contrast, customizable color schemes using libraries like `prompt_toolkit` or `rich`.

---

## 5. Modular Architecture
The system will be broken into the following components:

### 5.1. Interpreter Core
- **Module**: `solar_core`
- **Responsibilities**:
  - Command parsing and execution.
  - Prompt management and dynamic updates.
  - Color scheme configuration (using `prompt_toolkit` or `rich`).
- **Dependencies**: Python 3.10, `prompt_toolkit`, `rich`.

### 5.2. Data Ingestion Module
- **Module**: `solar_io`
- **Responsibilities**:
  - Read and parse multiple data formats (CSV, JSON, Parquet, Excel, SQL).
  - Store datasets in memory with unique identifiers.
- **Dependencies**: Pandas, SQLAlchemy, `openpyxl`, `pyarrow`.

### 5.3. EDA Module
- **Module**: `solar_eda`
- **Responsibilities**:
  - Summary statistics, visualizations, and missing value analysis.
  - Correlation matrix and p-value calculations.
- **Dependencies**: Pandas, NumPy, Matplotlib, Seaborn, SciPy.

### 5.4. Feature Engineering Module
- **Module**: `solar_features`
- **Responsibilities**:
  - Generate, scale, and encode features.
  - Create new datasets and update prompt.
- **Dependencies**: Pandas, Scikit-learn.

### 5.5. Machine Learning Module
- **Module**: `solar_ml`
- **Responsibilities**:
  - Implement unsupervised, classification, regression, and forecasting methods.
  - Integrate TensorFlow for neural network models.
  - Generate evaluation reports.
- **Dependencies**: Scikit-learn, TensorFlow, Statsmodels, Prophet.

### 5.6. Reporting Module
- **Module**: `solar_reports`
- **Responsibilities**:
  - Generate correlation and model evaluation reports.
  - Export reports in multiple formats.
- **Dependencies**: Pandas, Matplotlib, `reportlab` (for PDF), `markdown`.

### 5.7. Prompt System Module
- **Module**: `solar_prompt`
- **Responsibilities**:
  - Manage dynamic prompt updates.
  - Support multi-line input and styling.
- **Dependencies**: `prompt_toolkit`, `rich`.

---

## 6. User Workflow Example
1. Start interpreter: `Solar >>>`.
2. Ingest data: `read abc.csv` → Prompt updates to `Solar [abc] >>>`.
3. Perform EDA: `describe abc` → Displays summary statistics.
4. Generate features: `generate_features abc polynomial` → Creates `abc_features`, prompt updates to `Solar [abc, abc_features] >>>`.
5. Run ML model: `classify abc_features target logistic` → Trains model and displays metrics.
6. Generate report: `corr abc_features` → Outputs correlation report.
7. Build TensorFlow model: `tf_model abc_features dense` → Trains neural network.

---

## 7. Future Considerations
- Add support for additional data formats (e.g., HDF5, XML).
- Integrate cloud storage for data ingestion (e.g., S3, Google Cloud Storage).
- Support distributed computing for large-scale ML tasks (e.g., Dask, Spark).
- Add plugin system for custom user-defined commands.

---

## 8. Dependencies
- Python 3.10
- Pandas, NumPy, SciPy
- Matplotlib, Seaborn
- Scikit-learn, TensorFlow, Statsmodels, Prophet
- SQLAlchemy, `openpyxl`, `pyarrow`
- `prompt_toolkit`, `rich`, `reportlab`, `markdown`
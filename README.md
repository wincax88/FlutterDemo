# Flutter Clean Architecture Demo

这是一个基于 Clean Architecture 架构模式的 Flutter 项目脚手架。

## 项目结构

```
lib/
├── core/                    # 核心功能
│   ├── constants/          # 常量定义
│   ├── error/              # 错误处理
│   ├── network/            # 网络配置
│   ├── utils/              # 工具类
│   └── di/                 # 依赖注入
├── features/               # 功能模块
│   └── [feature_name]/
│       ├── data/           # 数据层
│       │   ├── datasources/    # 数据源
│       │   ├── models/         # 数据模型
│       │   └── repositories/   # 仓库实现
│       ├── domain/         # 领域层
│       │   ├── entities/       # 实体
│       │   ├── repositories/   # 仓库接口
│       │   └── usecases/       # 用例
│       └── presentation/   # 表现层
│           ├── bloc/           # 状态管理
│           ├── pages/          # 页面
│           └── widgets/        # 组件
└── main.dart              # 应用入口
```

## 架构说明

### Domain Layer (领域层)
- **Entities**: 业务实体，纯 Dart 类
- **Repositories**: 仓库接口定义
- **Use Cases**: 业务用例，单一职责原则

### Data Layer (数据层)
- **Data Sources**: 数据源（远程 API、本地数据库）
- **Models**: 数据模型，包含序列化/反序列化
- **Repository Implementations**: 仓库接口的具体实现

### Presentation Layer (表现层)
- **Bloc/Cubit**: 状态管理
- **Pages**: 页面组件
- **Widgets**: 可复用组件

## 运行项目

```bash
# 安装依赖
flutter pub get

# 生成代码（如果需要）
flutter pub run build_runner build --delete-conflicting-outputs

# 运行项目
flutter run
```

## 代码生成

项目使用了代码生成工具，运行以下命令生成代码：

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 依赖注入

项目使用 `get_it` 和 `injectable` 进行依赖注入。配置在 `lib/core/di/injection.dart` 中。


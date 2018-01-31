using UnityEditor;

public static class CfgOrmMenu {

  [MenuItem("Assets/ConfigORM/Open ORM Maker", false, 0)]
  public static void OpenCfgOrmMaker() {
    EditorWindow.GetWindow<UICfgOrmMaker>(false, "ORM Maker").Show();
  }

}

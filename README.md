# Instagram Clone

<p align = "center">
  <img src = "https://user-images.githubusercontent.com/73280175/137663714-d39ad47f-6d99-4b53-87b8-341844525112.png" width = "90%">
</p>


<p align="center">
<img src="https://img.shields.io/badge/-000000?style=flat&logo=ios" alt="ios" maxWidth="100%">
<img src="https://img.shields.io/badge/SwiftUI-000000?style=flat&logo=SwiftUI" alt="SwiftUI" maxWidth="100%">
<img src="https://img.shields.io/badge/Swift-000000?style=flat&logo=Swift" alt="swift" maxWidth="100%">
<img src="https://img.shields.io/badge/-Firebase-000000?style=flat&logo=Firebase" alt="firebase" maxWidth="100%">
<img src="https://img.shields.io/badge/-GitHub-181717?style=flat-square&logo=github" alt="github" maxWidth="100%">
<img src="https://img.shields.io/badge/-Xcode-000000?style=flat-square&logo=Xcode" alt="Xcode" maxWidth="100%">
</p>


---  
<br>

> ### 개요

인스타그램을 클론한 iOS 앱입니다. 인스타그램의 가장 기본적인 기능과 뷰들을 구현하였습니다. SwiftUI 환경을 기반으로 완성된 프로젝트이며 그 외에 적용된 기술 스택과 용도는 아래와 같습니다.

- MVVM 디자인 패턴 적용
- Firebase 클라우드 플랫폼 - 데이터 저장 및 가져오기 용도
- Combine 프레임워크 - Firebase 데이터베이스로부터 데이터 송수신 비동기 처리
- Kingfisher 라이브러리 - 이미지 캐싱

<br>

--- 

<br><br>

> ### Authentications (Sign In, Sign Up)

<p>
  <img src = "https://user-images.githubusercontent.com/73280175/137663698-c97d10af-1caf-4872-ac98-623bac94df22.png"  width = "70%">
</p>

- Firebase 플랫폼을 이용하여 회원 서비스(로그인, 비밀번호 찾기, 회원가입) 구현 
- <details><summary>관련 코드</summary>
    
    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Authentication/LoginView.swift">LoginView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Authentication/RegistrationView.swift">RegistrationView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Authentication/ResetPasswordView.swift">ResetPasswordView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/Authentication/AuthViewModel.swift">AuthViewModel.swift</a></p>

    </details>

<br><br>

> ### Feed

<p>
  <img src = "https://user-images.githubusercontent.com/73280175/137663709-141176a9-b6cb-41c9-9331-ce21e76ae6b8.png" width = "50%">
</p>

- 등록된 모든 포스트 표시
- Feed Cell 을 만들고 LazyVStack 으로 테이블 뷰 구현
- 각 Feed Cell 은 좋아요와 댓글 기능을 가짐
- <details><summary>관련 코드</summary>
    
    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Feed/FeedCell.swift">FeedCell.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/Feed/FeedCellViewModel.swift">FeedCellViewModel.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Feed/FeedView.swift">FeedView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/Feed/FeedViewModel.swift">FeedViewModel.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Comments/CommentView.swift">CommentView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/CommentViewModel.swift">CommentViewModel.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Comments/CommentCell.swift">CommentCell.swift</a></p>

    </details>

<br><br>

> ### Explore

<p>
  <img src = "https://user-images.githubusercontent.com/73280175/137663729-3361447b-1d56-4dfc-a8fb-0db2868d8548.png" width = "70%">
</p>

- LazyVStack을 사용하여 모든 포스트가 그리드뷰 형식으로 보여지도록 함
- nickName 혹은 fullName으로 다른 이용자 검색 가능
- <details><summary>관련 코드</summary>
    
    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Search/SearchView.swift">SearchView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/SearchViewModel.swift">SearchViewModel.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Search/SearchBar.swift">SearchBar.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Items/PostGridView.swift">PostGridView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/PostGridViewModel.swift">PostGridViewModel.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Items/UserListView.swift">UserListView.swift</a></p>

    </details>

<br><br>

> ### New Post

<p>
  <img src = "https://user-images.githubusercontent.com/73280175/137663719-0b5527b0-22a7-4272-bbfd-4cb59c40961c.png" width = "30%">
</p>

- 새로운 포스트 등록
- UIKit의 UIImagePickerController를 SwiftUI로 통합하여 이미지를 선택하도록 작업
- <details><summary>관련 코드</summary>
    
    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/UploadPost/UploadPostView.swift">UploadPostView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/UploadViewPostModel.swift">UploadViewPostModel.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/Utils/ImagePicker.swift">ImagePicker.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/API/ImageUploader.swift">ImageUploader.swift</a></p>

    </details>

<br><br>

> ### Notifications

<p>
  <img src = "https://user-images.githubusercontent.com/73280175/137663715-d8b7ff37-1c9b-4a6f-8c58-977b95b0da47.png" width = "30%">
</p>

- 다른 사용자의 팔로우, 좋아요 등의 알림을 받을 수 있음
- 현재 로그인 유저와의 관계를 반영하여 팔로우, 언팔로우 버튼의 상태 변화
- <details><summary>관련 코드</summary>
    
    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Notifications/NotificationsView.swift">NotificationsView.swift</a></p>
    
    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/Notification/NotificationsViewModel.swift">NotificationsViewModel.swift</a></p>
    
    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Notifications/NotificationCell.swift">NotificationCell.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/Notification/NotificationCellViewModel.swift">NotificationCellViewModel.swift</a></p>

    </details>

<br><br>

> ### Profile

<p>
  <img src = "https://user-images.githubusercontent.com/73280175/137663721-dc1bec9a-0314-4408-b9f7-7395e65cd122.png" width = "55%">
</p>

- 본인의 포스트와 팔로우, 팔로잉 정보 표시
- 다른 사용자의 프로필로 이동시 상대방을 팔로우 혹은 언팔로우 할 수 있음
- <details><summary>관련 코드</summary>
    
    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Profile/ProfileView.swift">ProfileView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/Profile/ProfileViewModel.swift">ProfileViewModel.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Profile/ProfileHeaderView.swift">ProfileHeaderView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Profile/UserStatView.swift">UserStatView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Profile/ProfileActionButtonView.swift">ProfileActionButtonView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Profile/EditProfileView.swift">EditProfileView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/Profile/EditProfileViewModel.swift">EditProfileViewModel.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/View/Items/PostGridView.swift">PostGridView.swift</a></p>

    <p><a href = "https://github.com/ronick-grammer/InstagramClone_SwiftUI/blob/main/InstagramSwiftUI/ViewModel/PostGridViewModel.swift">PostGridViewModel.swift</a></p>

    </details>
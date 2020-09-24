# Gif 검색/즐겨찾기 앱
움직이는 gif를 검색할 수 있고, 상세 정보를 볼 수 있으며, 마음에 드는 gif를 즐겨찾기할 수 있는 iOS 앱 개발 프로젝트입니다.
- 과제 가이드: https://drive.google.com/file/d/1n3TkNyDjOr0Dw7NHMDD2GgbHkN96NmfY/view

## [ 프로젝트 개발환경 ]
- iOS Depolyment Target: `Xcode 11.6`
- Supporting Device Target: `iOS 13`
- CocoPods Version:  `1.10.0.beta.2`
- Language: `Swift`


## [ 라이브러리 ]
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [Kingfisher](https://github.com/onevcat/Kingfisher)
- [SwiftJSON](https://github.com/SwiftyJSON/SwiftyJSON)

## [ 미리보기 ]
| 검색 화면                    | 즐겨찾기 화면                                  | 모달 화면                                  |
|:------------------------------:|:---------------------------------:|:---------------------------------:|
|<img src="GifSearchingApp/GitResource/search_page.png" width="270px" height="620px" title="검색 화면" alt="search_page"></img> |<img src="GifSearchingApp/GitResource/favorite_page2.png" width="270px" height="620px" title="즐겨찾기 화면" alt="favorite_page"> |<img src="GifSearchingApp/GitResource/modal_page_favorite_add.png" width="270px" height="620px" title="모달 화면" alt="modal_page_favorite_add"> |

### [ 기능 ]
#### 1. 검색 기능
**기본 기능**  
| 번호                    | 기능                                  | 구현 여부                                  |
|:------------------------------:|:---------------------------------:|:---------------------------------:|
|1 |Giphy API를 이용한 정적인 GIF 이미지 검색 기능 | O |
|1-1 |상단 [검색하기] 텍스트필드가 포커스 되면 키보드가 보여지도록 구현 | O |
|1-2 |스크롤뷰를 스크롤했을 때, 키보드의 Enter를 쳤을 때, 키보드가 내려가도록 구현 | O |
|1-3 |영단어를 입력했을 때마다 검색 API를 호출하도록 구현 |  △ |
|2 |검색 필드에 빈 텍스트가 입력되어 있다면 빈 화면을 보여주도록 구현 | O |
|3 |페이징을 이용해 API의 최대로 조회 가능한 이미지 갯수 (limit=24)만큼 불러오도록 구현 | O |
|4 |리스트 최하단에 <더보기> 버튼을 두어, 이후의 더 많은 이미지를 불러올 수 있도록 구현 | O |
|5 |각 이미지를 누를 때 Modal이 뜨도록 구현 | O |

**필수 사항**  
| 번호                    | 기능                                  | 구현 여부                                  |
|:------------------------------:|:---------------------------------:|:---------------------------------:|
|1 |어느 디바이스에서든 한 row에 최대 3개 단위의 이미지가 그리드 형식으로 노출되도록 구현 | O |
|1-1 |그리드 내의 Cell은 가로 세로의 길이는 1:1로 동일하게 구현 | O |
|2 |이미지 비율은 유지된 채 사이즈가 Cell의 사이즈를 넘지 않도록 맞추기 | O |

**추가 기능**  
| 번호                    | 기능                                  | 구현 여부                                  |
|:------------------------------:|:---------------------------------:|:---------------------------------:|
|1 |정적인 GIF 이미지를 동적으로 움직이게 구현  | X |
|2 |무한스크롤을   | X |

**그 외 구현 기능**

**2. 즐겨찾기 기능** <br>


**3. 모달 기능** <br>




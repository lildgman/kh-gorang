<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${contextPath }/resources/css/board/commonWrite.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <!-- 서머노트를 위해 추가해야할 부분 -->
            <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
            <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
        </head>

        <body>
            <jsp:include page="../common/header.jsp" />
            <main id="common-write">
                <div id="write-top">
                    <div id="writeBtnSection">
                        <div id="tempStorageBtn">
                            <input type="button" value="임시저장">
                        </div>
                        <div id="writeSubmitBtn">
                            <input type="button" value="등록하기">
                        </div>
                    </div>
                </div>
                <div id="write-container">
                    <div id="writeTitleSection">
                        <div id="selectCategory">
                            <select name="boardCategory" id="boardCategory">
                                <option selected disabled hidden>카테고리</option>
                                <option value=""></option>
                                <option value=""></option>
                                <option value=""></option>
                            </select>
                        </div>
                        <div id="writeTitle">
                            <input type="text" placeholder="제목을 입력해주세요.">
                        </div>
                    </div>
                    <div id="writeUploadThumbnail">
                        <div id="uploadThumbnailSection">
                            <div id="uploadThumbnailSpan">
                                <span>대표이미지를 업로드 해주세요.</span>
                            </div>
                            <div id="uploadThumbSizeSpan">
                                <span>*권장 사이즈</span><br>
                                <span>모바일: 1920 x 1920, 최소 1400 x 1400(1:1 비율) PC: 1920 x 1080, 최소 1400 x 787(16:9
                                    비율)</span>
                            </div>
                            <div id="uploadThumbBtn">
                                <label className="input-file-button" for="input-file">
                                    대표이미지 넣기
                                </label>
                                <input type="file" id="input-file" />
                            </div>
                        </div>
                    </div>
                    <textarea class="summernote" name="editordata"></textarea>
                </div>
            </main>
            <jsp:include page="../common/footer.jsp" />
            <script>
                $('.summernote').summernote({
                    height: 394,
                    lang: "ko-KR",
                });
            </script>
        </body>

        </html>